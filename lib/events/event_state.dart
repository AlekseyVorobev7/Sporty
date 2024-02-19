part of 'event_bloc.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}

class EventCreated extends EventState {
  Events event;
  EventCreated(this.event);
}

class LoadingEvent extends EventState {}

class LoadedAllEvents extends EventState {
  List<Marker> markers;
  LoadedAllEvents(this.markers);
}

class LoadedAllEvetsLent extends EventState {
  List<Align> content;
  LoadedAllEvetsLent(this.content);
}
