import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:guvoboso/events/event_bloc.dart';
import 'package:guvoboso/frames/main_frame.dart';
import 'package:guvoboso/frames/prifil.dart';
import 'package:guvoboso/user/user_bloc.dart';

class LentaFrame extends StatefulWidget {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  const LentaFrame(
      {super.key, required this.userBloc, required this.eventBloc});

  @override
  State<LentaFrame> createState() =>
      _LentaFrameState(userBloc: userBloc, eventBloc: eventBloc);
}

class _LentaFrameState extends State<LentaFrame> {
  final UserBloc userBloc;
  final EventBloc eventBloc;

  _LentaFrameState({required this.userBloc, required this.eventBloc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<EventBloc, EventState>(
              builder: (BuildContext context, state) {
                if (state is LoadedAllEvetsLent) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.content.length,
                      itemBuilder: (BuildContext context, int index) {
                        return state.content[index];
                      });
                }
                if (state is LoadingEvent) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Text('Bозникли проблемы');
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 75,
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 216, 81, 240),
                    Color.fromARGB(255, 142, 30, 161),
                    Color.fromARGB(255, 7, 28, 219)
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: GNav(
                  gap: 8,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: "Лента",
                    ),
                    GButton(
                      icon: Icons.map,
                      text: "Карта",
                      onPressed: () {
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
                                    )));
                      },
                    ),
                    GButton(
                      icon: Icons.man,
                      text: "Профиль",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                      value: userBloc,
                                      child: BlocProvider.value(
                                        value: eventBloc,
                                        child: ProfelFrame(
                                          userBloc: userBloc,
                                          eventBloc: eventBloc,
                                        ),
                                      ),
                                    )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
