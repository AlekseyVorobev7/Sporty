// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guvoboso/events/event_bloc.dart';
import 'package:guvoboso/frames/login.dart';
import 'package:guvoboso/frames/main_frame.dart';
import 'package:guvoboso/user/user_bloc.dart';

class RegisetScreen extends StatefulWidget {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  const RegisetScreen(
      {super.key, required this.userBloc, required this.eventBloc});

  @override
  State<RegisetScreen> createState() =>
      _RegisetScreenState(userBloc: userBloc, eventBloc: eventBloc);
}

class _RegisetScreenState extends State<RegisetScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController first_nameController = TextEditingController();
  TextEditingController second_nameController = TextEditingController();
  final UserBloc userBloc;
  final EventBloc eventBloc;

  _RegisetScreenState({required this.userBloc, required this.eventBloc});
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    first_nameController.dispose();
    second_nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 430,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        'Guvoboso',
                                        maxLines: 1,
                                        minFontSize: 24,
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 60,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: AutoSizeText(
                                          'Регистрация',
                                          maxLines: 1,
                                          minFontSize: 16,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Urbanist',
                                            color: Color(0xFF101213),
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: first_nameController,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Имя',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: second_nameController,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Фамилия',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: emailController,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Почта',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        // ignore: sized_box_for_whitespace
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: passwordController,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.password
                                            ],
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: 'Пароль',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF1F4F8),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: TextButton(
                                          onPressed: () {
                                            userBloc.add(UserRegisterEvent(
                                                first_nameController.text
                                                    .trim(),
                                                second_nameController.text
                                                    .trim(),
                                                emailController.text.trim(),
                                                passwordController.text
                                                    .trim()));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlocProvider.value(
                                                          value: userBloc,
                                                          child: BlocProvider
                                                              .value(
                                                            value: eventBloc,
                                                            child: MainFrame(
                                                              eventBloc:
                                                                  eventBloc,
                                                              userBloc:
                                                                  userBloc,
                                                            ),
                                                          ),
                                                        )));
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Color.fromARGB(255, 5, 76, 228),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                70, 10, 70, 10),
                                            child: AutoSizeText(
                                                'Зарегистрироваться',
                                                maxLines: 1,
                                                minFontSize: 14,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const AutoSizeText(
                                                  "Нет аккаунта?",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginWidget()));
                                                  },
                                                  child: AutoSizeText(
                                                    'Войти',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
