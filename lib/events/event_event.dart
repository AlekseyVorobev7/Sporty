part of 'event_bloc.dart';

@immutable
abstract class EventEvent {}

class CreateEventEvent extends EventEvent {
  final String uid;
  final String contact;
  final String type;
  final String description;
  final String docs;
  final String name;
  final double locS;
  final double locD;
  MyUser user;
  CreateEventEvent(
      {required this.type,
      required this.uid,
      required this.contact,
      required this.description,
      required this.docs,
      required this.name,
      required this.locS,
      required this.locD,
      required this.user});
}

class LoadAllEvents extends EventEvent {
  BuildContext context;
  LoadAllEvents(this.context);
}

class LoadAllEventsLent extends EventEvent {
  BuildContext context;
  LoadAllEventsLent(this.context);
}
