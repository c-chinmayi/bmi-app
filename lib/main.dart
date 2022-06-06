import 'package:bmi/api.dart';
import 'package:flutter/material.dart';
import 'package:bmi/result.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

double height=150;
double weight=50;
double calculateBMI(double height, double weight){
  double heightSquare = height * height;
  double result = weight*10000 / heightSquare;
  return result;
}
double bmi=calculateBMI(height, weight);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        backgroundColor:Colors.deepOrangeAccent,
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Column(
          children:[



          SizedBox(
          height:10,
          ),
            Text("WELCOME TO THE BMI CALCULATOR!",style:TextStyle(fontSize:50)),
            SizedBox(
              height:100,
            ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

              Container(
              height: 200,
              width: 300,
              color: Colors.deepOrangeAccent,
              child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.all(5.0),
                    child:Text("Height (in cm)",style:TextStyle(fontSize: 25,)),
                    ),


                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("${height.round()}",
                      style:TextStyle(fontSize: 30)
                      ,),
                  ),
                  Slider(
                    value: height,
                    max: 200,
                    min: 100,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.deepOrangeAccent,
              child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.all(5.0),
                    child:Text("Weight (in kgs)",style:TextStyle(fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("${weight.round()}",
                      style:TextStyle(
                          fontSize: 30)
                      ,),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        setState((){
                          weight--;
                        });

                        print(weight);
                      }, child: Icon(Icons.remove)),
                      TextButton(onPressed: (){
                        setState((){
                          weight++;
                        });

                        print(weight);
                      }, child: Icon(Icons.add))
                    ],
                  ),

                ],
              ),
            ),
            ],
          ),
            SizedBox(
              height:100,
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>result()));
              },
              child:   Container(
                height: 70,
                width: 200,
                color: Colors.deepOrangeAccent,
                child: Center(child: Text("Calculate",style:TextStyle(fontSize:25))),
              ),
            )





          ],
        ),
      ),
    );
  }
}
