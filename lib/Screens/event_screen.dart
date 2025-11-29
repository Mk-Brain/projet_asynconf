import 'package:asynconf/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final events = [
    {
      "speaker" : "jin",
      "date" : "24/11/2025 13h-14h",
      "subject" : "l'art de batre belion",
      "avatar" : "jin"
    },
    {
      "speaker" : "isagi",
      "date" : "24/11/2025 15h-17h",
      "subject" : "la meta vision",
      "avatar" : "isagi"
    },
    {
      "speaker" : "toya",
      "date" : "25/11/2025 13h-14h",
      "subject" : "comment battre gojo",
      "avatar" : "toya"
    },
    {
      "speaker" : "entix",
      "date" : "28/11/2025 13h-14h",
      "subject" : "demon hunter",
      "avatar" : "entrix"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
        itemBuilder: (context, index){
      final event = events[index];
      final avatar = event['avatar'];
      final speaker = event['speaker'];
      final subject = event['subject'];
      final date = event['date'];
      return Card(
        child: ListTile(
          leading: Image.asset('assets/images/$avatar.jpg',height: 100,),
          title: Text("$speaker ($date)"),
          subtitle: Text("$subject"),
          trailing: Icon(Icons.more_vert),
        ),
      );
    }
    );
  }
}
