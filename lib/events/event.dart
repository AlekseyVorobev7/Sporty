class Events {
  final String uid;
  final String contact;
  final String description;
  final String docs;
  final String type;
  final String name;
  final double locS;
  final double locD;

  Events(
      {required this.type,
      required this.uid,
      required this.contact,
      required this.description,
      required this.docs,
      required this.name,
      required this.locS,
      required this.locD});
}
