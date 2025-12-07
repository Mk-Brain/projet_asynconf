class Event {
  final String speaker;
  final String subject;
  final String avatar;
  final String type;
  final String date;

  Event({
    required this.subject,
    required this.speaker,
    required this.avatar,
    required this.type,
    required this.date,
  });

  factory Event.fromData(dynamic data) {
    return Event(
      subject: data['subject'],
      speaker: data['speaker'],
      avatar: data['avatar'],
      type: data['type'],
      date: data['date'],
    );
  }
}
