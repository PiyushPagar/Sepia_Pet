// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:get/get.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/color.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _item=[];
 

  Future<void> readJson() async{
    final String response= await rootBundle.loadString("assets/petsList.json");
    final data = await json.decode(response);
    setState(() {
      _item=data["pets"];
      print("....loaded data ${_item.length}");

    });
  }

  _launchURLApp(urls) async  {
    print(urls);
    var url = Uri.parse(urls);
     await launchUrl(url);
  }
  


  @override
  void initState() {
    super.initState();
     readJson();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => readJson());
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body:  Column(children: [
          SizedBox(
              height: 70,
            ),
            Container(
               child:Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                           margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text('Sepia Pets',
                        style: (TextStyle(fontFamily: 'Circular' ,fontSize: 30) ),),
                      ),
                      ),
            ),

            Expanded(
              child:  ListView.builder(
                itemCount: _item.length,
                itemBuilder: (context,index){
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
                                      color: Colors.white,
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
                                              image: DecorationImage(
                                                  image: NetworkImage(_item[index]["image_url"]
                                                  ),
                                                  //  AssetImage(
                                                  //     "assets/images/" +
                                                  //         products[index]['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                       _item[index]["title"],
                                        style: TextStyle(fontFamily: 'Circular' ,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                      TextButton(
                                        child: Text(
                                        "See Datils",
                                         style: TextStyle(fontSize: 15),
                                       ),
                                    onPressed: () =>_launchURLApp(_item[index]["content_url"].toString()), //fun1
                                      )
                                      
                                ],
                                  ),
                                ),
                               
                              ],
                            )),
                          ),
                        ),
                      );
                   

                },
                )
            
            )



          ]
          )
      );
  }
}

