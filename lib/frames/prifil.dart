import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:guvoboso/events/event_bloc.dart';
import 'package:guvoboso/frames/lenta.dart';
import 'package:guvoboso/frames/main_frame.dart';
import 'package:guvoboso/user/user_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfelFrame extends StatefulWidget {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  const ProfelFrame(
      {super.key, required this.userBloc, required this.eventBloc});

  @override
  State<ProfelFrame> createState() =>
      _ProfelFrameState(userBloc: userBloc, eventBloc: eventBloc);
}

class _ProfelFrameState extends State<ProfelFrame> {
  final UserBloc userBloc;
  final EventBloc eventBloc;

  _ProfelFrameState({required this.userBloc, required this.eventBloc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (BuildContext context, state) {
                if (state is UserLoadedState) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/images/avatar.png"),
                              fit: BoxFit.cover,
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AutoSizeText(
                            '${state.user.first_name} ${state.user.second_name}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Readex Pro',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse('https://t.me/guvoboso_bot')),
                            child: Text(
                              'Купить подписку',
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (state is UserLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Text("Возникли проблемы");
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
                      icon: Icons.man,
                      text: "Профиль",
                    ),
                    GButton(
                      icon: Icons.home,
                      text: "Лента",
                      onPressed: () {
                        eventBloc.add(LoadAllEventsLent(context));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                      value: userBloc,
                                      child: BlocProvider.value(
                                        value: eventBloc,
                                        child: LentaFrame(
                                          userBloc: userBloc,
                                          eventBloc: eventBloc,
                                        ),
                                      ),
                                    )));
                      },
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
