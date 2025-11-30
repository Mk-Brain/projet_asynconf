import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddEvenPage extends StatefulWidget {
  const AddEvenPage({super.key});

  @override
  State<AddEvenPage> createState() => _AddEvenPageState();
}

class _AddEvenPageState extends State<AddEvenPage> {
  final _formKey = GlobalKey<FormState>();
  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedconftype = 'talk';

  String _dateconf = "choisissez un date";


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                ),
                labelText: "Nom conference",
                hintText: "Entrer le nom de la conference",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "tu doit completer le texte ";
                }
              },
              controller: confNameController,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
                ),
                labelText: "Nom du speaker",
                hintText: "Entrer le nom du speaker",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "tu doit completer le texte ";
                }
              },
              controller: speakerNameController,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                DropdownMenuItem(value: 'demo', child: Text("Demo code")),
                DropdownMenuItem(value: 'partner', child: Text("Partner")),
              ],
              value: selectedconftype,
              onChanged: (value) {
                setState(() {
                  selectedconftype = value!;
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            /*TextFormField(
              decoration: InputDecoration(
                labelText: "choisir une date",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              validator: (value){
                if(value == null){
                  return 'veuillez entrer une date';
                }else{
                  return null;
                };
              },
              onSaved: (value) => _dateconf = value!,
            ),*/
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  iconColor: Colors.black,

                  side: BorderSide(),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  )
                ),
                onPressed: () async {
                  side: BorderSide(color: Colors.blue);
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.timestamp(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2035),
                  );

                  if (picked != null) {
                    setState(() {
                      _dateconf ="${picked.toString()}";
                    });
                  }

                },
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.calendar_month, size: 22,),
                    Text( _dateconf, style: TextStyle(color: Colors.black), textAlign: TextAlign.start,),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined, size: 26,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    )
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    final confname = confNameController.text;
                    final speakername = speakerNameController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Envoi en cours ...")),
                    );
                    FocusScope.of(context).requestFocus(FocusNode());

                    //ajout dans la bd
                    CollectionReference enventsRef = FirebaseFirestore.instance.collection('Events');
                    enventsRef.add({
                      "speaker" : speakername,
                      "subject" : confname,
                      "date" : _dateconf,
                        "type" : selectedconftype,
                      "avatar" : "jin"
                    });
                  }
                },
                child: Text("Envoyer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
