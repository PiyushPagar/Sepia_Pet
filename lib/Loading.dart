import 'package:flutter/material.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 260, left: 10),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fitWidth,
                    width: 300,
                    height: 200,
                  ),
                  Text("Sepia Pets",style: (TextStyle(fontFamily: 'Circular' ,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
