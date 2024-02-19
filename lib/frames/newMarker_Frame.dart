import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guvoboso/events/event_bloc.dart';
import 'package:guvoboso/frames/main_frame.dart';
import 'package:guvoboso/user/user.dart';
import 'package:guvoboso/user/user_bloc.dart';

class NewMarkerFrame extends StatefulWidget {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  final MyUser user;
  const NewMarkerFrame(
      {super.key,
      required this.userBloc,
      required this.eventBloc,
      required this.user});

  @override
  State<NewMarkerFrame> createState() => _NewMarkerFrameState(
      userBloc: userBloc, eventBloc: eventBloc, user: user);
}

class _NewMarkerFrameState extends State<NewMarkerFrame> {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  final MyUser user;
  TextEditingController nameController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController docsController = TextEditingController();
  TextEditingController locDController = TextEditingController();
  TextEditingController locSController = TextEditingController();
  _NewMarkerFrameState(
      {required this.userBloc, required this.eventBloc, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: AutoSizeText(
                    'Заполните данные мероприятия',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Название",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: nameController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Описание",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: discriptionController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Контактная информация (VK, Telegram, Почта)",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: contactController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Вид спорта",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: typeController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Необходимые документы",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: docsController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Широта (Место где будет проходить мероприятие) в граусах пример: 57.12",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: locSController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Container(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      children: [
                        const AutoSizeText(
                          "Долгота (Место где будет проходить мероприятие) в граусах пример: 57.12",
                          maxLines: 1,
                          minFontSize: 16,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF101213),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 100,
                          controller: locDController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: TextButton(
                    onPressed: () {
                      eventBloc.add(CreateEventEvent(
                          type: typeController.text.trim(),
                          uid: user.uid,
                          contact: contactController.text.trim(),
                          description: discriptionController.text.trim(),
                          docs: docsController.text.trim(),
                          name: nameController.text.trim(),
                          locS: double.parse(locSController.text.trim()),
                          locD: double.parse(locDController.text.trim()),
                          user: user));
                      eventBloc.add(LoadAllEvents(context));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: userBloc,
                            child: BlocProvider.value(
                              value: eventBloc,
                              child: MainFrame(
                                userBloc: userBloc,
                                eventBloc: eventBloc,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 5, 76, 228),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      child: AutoSizeText('Создать',
                          maxLines: 1,
                          minFontSize: 14,
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
