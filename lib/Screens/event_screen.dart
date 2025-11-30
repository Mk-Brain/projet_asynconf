import 'package:asynconf/widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final events = [

    ];

  @override
  Widget build(BuildContext context) {

    Future<void> _showMyEventDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
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
            List<dynamic> events = [];
            snapshot.data!.docs.forEach((action){
              events.add(action);
            });

            return ListView.builder(
              itemCount: events.length,
              itemBuilder:(context, index) {
                final event = events[index];
                final avatar = event['avatar'];
                final speaker = event['speaker'];
                final date = event['date'];
                final subject = event['subject'];
                return Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/$avatar.jpg"),
                    title: Text("$speaker ($date)"),
                    subtitle: Text("$subject"),
                    trailing: IconButton(onPressed: (){
                      _showMyEventDialog();
                    }, icon: Icon(Icons.info)),
                  ),
                );
              });
            }
      ),
    );
  }
}
