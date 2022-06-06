import 'package:flutter/material.dart';
import 'package:bmi/main.dart';


class result extends StatefulWidget {
  result({Key? key}) : super(key: key);


  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        title: Text("BMI"),
        backgroundColor:Colors.deepOrangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("YOUR BMI IS ",style:TextStyle(fontSize: 30)),
          Text("${bmi}",style:TextStyle(fontSize: 50)),

          SizedBox(
            height:100,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:
            Center(
              child: Container(
                color: Colors.deepOrangeAccent,
                height: 75,
                width: 200,
                child: Center(child: Text("Recalculate",style:TextStyle(fontSize: 30))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}