import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'user.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLogInEvent>(_onLoginUser);
    on<UserRegisterEvent>(_onRegisterEvent);
  }

  _onLoginUser(UserLogInEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      String uid = FirebaseAuth.instance.currentUser!.uid;
      print(uid);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get()
          .then((sn) {
        Map<String, dynamic> data = sn.data() as Map<String, dynamic>;
        MyUser user = MyUser(uid, data['first_name'], data['second_name'],
            data['email'], data['city'], data['rating']);
        print(user.city);
        emit(UserLoadedState(user));
      });
    } catch (e) {
      emit(UserLoadingError());
      print(e);
    }
  }

  _onRegisterEvent(UserRegisterEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .set({
        "first_name": event.first_name,
        "second_name": event.second_name,
        "email": event.email,
        "rating": 0,
        "city": "Нижний Новгород",
        "organizer": false,
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      String uid = FirebaseAuth.instance.currentUser!.uid;
      print(uid);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get()
          .then((sn) {
        Map<String, dynamic> data = sn.data() as Map<String, dynamic>;
        MyUser user = MyUser(uid, data['first_name'], data['second_name'],
            data['email'], data['city'], data['rating']);
        print(user.city);
        emit(UserLoadedState(user));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(UserLoadingError());
    } catch (e) {
      print(e);
      emit(UserLoadingError());
    }
  }
}
