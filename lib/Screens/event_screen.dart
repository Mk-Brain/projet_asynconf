import 'package:asynconf/widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events = [

    ];

  @override
  Widget build(BuildContext context) {

    Future<void> _showMyEventDialog(Event eventdata) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Conserence ${eventdata.speaker}"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image.asset("assets/images/${eventdata.avatar}.jpg", height: 120,),
                  Text("Titre : ${eventdata.subject}"),
                  Text("Speaker : ${eventdata.speaker}"),
                  Text("Date : ${eventdata.date}"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Fermer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Center(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Events").snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(!snapshot.hasData){
              return Text("Aucune conference prevue");
            }
            List<Event> events = [];
            snapshot.data!.docs.forEach((action){
              events.add(Event.fromData(action));
            });

            return ListView.builder(
              itemCount: events.length,
              itemBuilder:(context, index) {
                final event = events[index];
                final avatar = event.avatar;
                final speaker = event.speaker;
                final date = event.date;
                final subject = event.subject;
                return Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/$avatar.jpg"),
                    title: Text("$speaker ($date)"),
                    subtitle: Text(subject),
                    trailing: IconButton(onPressed: (){
                      _showMyEventDialog(event);
                    }, icon: Icon(Icons.info)),
                  ),
                );
              });
            }
      ),
    );
  }
}
