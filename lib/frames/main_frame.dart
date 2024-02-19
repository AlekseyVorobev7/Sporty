import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:guvoboso/events/event_bloc.dart';
import 'package:guvoboso/frames/error.dart';
import 'package:guvoboso/frames/lenta.dart';
import 'package:guvoboso/frames/newMarker_Frame.dart';
import 'package:guvoboso/frames/prifil.dart';
import 'package:guvoboso/user/user.dart';
import 'package:guvoboso/user/user_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainFrame extends StatefulWidget {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  MainFrame({
    super.key,
    required this.userBloc,
    required this.eventBloc,
  });

  @override
  State<MainFrame> createState() => _MainFrameState(userBloc, eventBloc);
}

class _MainFrameState extends State<MainFrame> {
  final UserBloc userBloc;
  final EventBloc eventBloc;
  late String uidp;
  _MainFrameState(this.userBloc, this.eventBloc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<EventBloc, EventState>(
            builder: (BuildContext context, state) {
              if (state is LoadedAllEvents) {
                return FlutterMap(
                  options: const MapOptions(
                      center: LatLng(56.3287, 44.002), zoom: 13.0),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: state.markers)
                  ],
                );
              }
              if (state is LoadingEvent) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const Text("Возникли проблемы");
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (BuildContext context, state) {
              if (state is UserLoadedState) {
                return Container(
                  width: 70,
                  height: 70,
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      MyUser user = state.user;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                    value: userBloc,
                                    child: BlocProvider.value(
                                      value: eventBloc,
                                      child: NewMarkerFrame(
                                        user: user,
                                        userBloc: userBloc,
                                        eventBloc: eventBloc,
                                      ),
                                    ),
                                  )));
                    },
                    icon: const Icon(
                      Icons.plus_one,
                      color: Colors.black,
                      size: 50,
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
                  const GButton(
                    icon: Icons.map,
                    text: "Карта",
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
    );
  }
}
