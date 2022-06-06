import 'dart:convert';

import"package:flutter/material.dart";
import"package:http/http.dart" as http;

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("API Page"),
      ),
      body: Center(
        child:Column(
          children:[
            TextButton(onPressed: (){
              apicall();
            }, child:Text("Call API") ),
            FutureBuilder(future:apicall(), builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data);
              }
              else{
                return CircularProgressIndicator();
              }
            })
          ],
        ),
      ),

    );
  }
}


Future<String> apicall() async{
  final url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Bangalore&appid=be6c08281941a518a7763a15c4d2a206");
  final response=await http.get(url);
  print(jsonDecode(response.body)["weather"][0]["description"]);
  String output=jsonDecode(response.body)["weather"][0]["description"];
  return output;
}