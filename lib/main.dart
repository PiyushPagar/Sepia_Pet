
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeScreen.dart';
import 'Loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Sepia Pets',
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home: const MyHomePage(title: 'Sepia Pets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
     DateTime specificDate = DateTime.now()
      .add(const Duration(seconds: 3)); 
   @override
  void initState() {
    super.initState();
  }

  bool authResult=true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          builder: (context, authResult) {
            if (DateTime.now().weekday==1||DateTime.now().weekday==2||DateTime.now().weekday==3||
            DateTime.now().weekday==4||DateTime.now().weekday==5) {
              if(DateTime.now().hour>=10&&DateTime.now().hour<=18){
              print(DateTime.now().hour);
             Timer(Duration(seconds: 2), () {
              print(DateTime.now().weekday);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen()), 
                    (Route<dynamic> route) => false,
                  );
                });
                }
                else {
                 print("not try");
                   Timer(Duration(seconds: 3), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            _buildPopupDialog(context)), 
                    (Route<dynamic> route) => false,
                  );
                });
              } 
              } else {
                 print("not try");
                   Timer(Duration(seconds: 3), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            _buildPopupDialog(context)), 
                    (Route<dynamic> route) => false,
                  );
                });
              }
              return LoadingScreen();
            }
          ),
    );
  }

}

  Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Currently server is off"),
        Text("Please try again in working hours"),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          // Navigator.of(context).pop();
          SystemNavigator.pop();
        },
        child: Text('Close',
        style: (TextStyle(color: Colors.blue))),
      ),
    ],
  );
}
