import 'package:asynconf/Screens/event_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 7.0, right: 7.0),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                "assets/images/logo1.jpg",
                width: 140,
                height: 140,
                //color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                "AsynConf2022",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Salon virtuel de l'informatique du 27 au 29 octobre 2022",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
              /*Padding(
                padding: EdgeInsetsGeometry.only(top: 13),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>Event()
                        )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 30,fontWeight: FontWeight.bold,),
                      Text("Afficher le planning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),*/
              Spacer(),
            ],
          ),
        ),
      );
  }
}
