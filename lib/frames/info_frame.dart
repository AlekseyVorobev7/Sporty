import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:guvoboso/events/event.dart';

class InfoFrame extends StatefulWidget {
  final Events event;
  InfoFrame({super.key, required this.event});

  @override
  State<InfoFrame> createState() => _InfoFrameState(event);
}

class _InfoFrameState extends State<InfoFrame> {
  final Events event;

  _InfoFrameState(this.event);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      'Название: ${event.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      'Описание: ${event.description}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      AutoSizeText(
                        'Контакты: ${event.contact}',
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
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      'Вид спорта: ${event.type}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      'Необходимые документы: ${event.docs}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
