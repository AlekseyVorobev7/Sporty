import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:guvoboso/events/event.dart';
import 'package:guvoboso/frames/info_frame.dart';
import 'package:guvoboso/user/user.dart';
import 'package:guvoboso/user/user_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<CreateEventEvent>(_onCreateEvent);
    on<LoadAllEvents>(_onLoadAllEvents);
    on<LoadAllEventsLent>(_onLoadAllEventsLent);
  }

  _onCreateEvent(CreateEventEvent event, Emitter<EventState> emit) async {
    try {
      await FirebaseFirestore.instance.collection('Events').add({
        "contact": event.contact,
        "type": event.type,
        "creater_uid": event.user.uid,
        "discription": event.description,
        "docs": event.docs,
        "location": event.locS,
        "locationD": event.locD,
        "name": event.name,
      });
      emit(EventCreated(Events(
        type: event.type,
        uid: event.user.uid,
        contact: event.contact,
        description: event.description,
        docs: event.docs,
        name: event.name,
        locS: event.locS,
        locD: event.locD,
      )));
    } catch (e) {
      print(e);
    }
  }

  _onLoadAllEvents(LoadAllEvents event, Emitter<EventState> emit) async {
    emit(LoadingEvent());
    List<Marker> masrkers = [];
    List<Events> events = [];
    Set<String> docId = {};
    await FirebaseFirestore.instance
        .collection('Events')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docId.add(document.reference.id);
            }));
    for (int i = 0; i < docId.length; i++) {
      await FirebaseFirestore.instance
          .collection('Events')
          .doc(docId.elementAt(i))
          .get()
          .then((sn) {
        Map<String, dynamic> data = sn.data() as Map<String, dynamic>;
        Events ev = Events(
            type: data["type"],
            uid: data["creater_uid"],
            contact: data["contact"],
            description: data["discription"],
            docs: data["docs"],
            name: data["name"],
            locS: data["location"],
            locD: data["locationD"]);
        events.add(ev);
        print(ev);
        masrkers.add(
          Marker(
            width: 40,
            height: 40,
            point: LatLng(ev.locS, ev.locD),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    event.context,
                    MaterialPageRoute(
                        builder: (context) => InfoFrame(event: ev)));
              },
              icon: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 45,
              ),
            ),
          ),
        );
      });
    }
    emit(LoadedAllEvents(masrkers));
  }

  _onLoadAllEventsLent(
      LoadAllEventsLent event, Emitter<EventState> emit) async {
    emit(LoadingEvent());
    List<Align> content = [];
    List<Events> events = [];
    List<String> docId = [];
    await FirebaseFirestore.instance
        .collection('Events')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docId.add(document.reference.id);
            }));
    for (int i = 0; i < docId.length; i++) {
      await FirebaseFirestore.instance
          .collection('Events')
          .doc(docId.elementAt(i))
          .get()
          .then((sn) {
        Map<String, dynamic> data = sn.data() as Map<String, dynamic>;
        Events ev = Events(
            type: data["type"],
            uid: data["creater_uid"],
            contact: data["contact"],
            description: data["discription"],
            docs: data["docs"],
            name: data["name"],
            locS: data["location"],
            locD: data["locationD"]);
        events.add(ev);
        print(ev);
      });
    }
    for (Events ev in events) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(ev.uid)
          .get()
          .then((sn) {
        Map<String, dynamic> data = sn.data() as Map<String, dynamic>;
        MyUser user = MyUser(ev.uid, data['first_name'], data['second_name'],
            data['email'], data['city'], data['rating']);
        content.add(Align(
          alignment: Alignment.topCenter,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  event.context,
                  MaterialPageRoute(
                      builder: (context) => InfoFrame(event: ev)));
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 203, 203),
                borderRadius: BorderRadius.circular(30),
              ),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/avatar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AutoSizeText(
                          '${user.first_name} ${user.second_name}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/al.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AutoSizeText(
                        '${ev.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      });
    }
    emit(LoadedAllEvetsLent(content));
  }
}
