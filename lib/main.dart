import 'package:asynconf/Screens/event_screen.dart';
//import 'package:asynconf/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'Screens/add_even_page.dart';
import 'Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titre = "AsynConf2022";

  int _currentindex = 0;

  void switchpage(index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 16,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: [
              Text("Acceuil"),
              Text("Evenements"),
              Text("Ajout Evenements")
            ][_currentindex],
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          body: [Acceuil(), EventPage(), AddEvenPage()][_currentindex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            selectedItemColor: Colors.blue,
            selectedFontSize: 15,
            unselectedFontSize: 17,
            selectedIconTheme: IconThemeData(
              size: 30
            ),
            unselectedIconTheme: IconThemeData(
                size: 18
            ),
            currentIndex: _currentindex,
            onTap: switchpage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Acceuil"),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "Planning",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Ajout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
