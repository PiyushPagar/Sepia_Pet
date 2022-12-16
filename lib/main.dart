import 'package:flutter/material.dart';
import 'package:flutter_application_1/color.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                Column(
            children: [
              GetBuilder<PopularProductController>(builder: (controller) {
                return ListView.builder(
                    // itemCount: productController.productResponseList.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            color: black.withOpacity(0.1),
                                            blurRadius: 2)
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 30),
                                          width: 280,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              // image: DecorationImage(
                                              //     image: NetworkImage(
                                              //       serverUrl +
                                              //           'api/auth/serveproducts/${productController.productResponseList[index]['imageUrl'].toString()}',
                                              //     ),
                                              //     //  AssetImage(
                                              //     //     "assets/images/" +
                                              //     //         products[index]['img']),
                                              //     fit: BoxFit.cover)
                                                  ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                       "image",
                                       
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      );
                    });
              })
            ],
          )
        ]),
      
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

class PopularProductController {
}
