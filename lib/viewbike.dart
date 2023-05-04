import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bookrental.dart';

class viewb extends StatefulWidget {
  const viewb({Key? key}) : super(key: key);

  @override
  State<viewb> createState() => _viewbState();
}

class _viewbState extends State<viewb> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Center(


        child: ListView(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: 300,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       color: Colors.yellow,
              //       border: Border.all(width: 5,color: Colors.black87,),
              //       borderRadius: BorderRadius.circular(10,),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  child: Image.asset('lib/assets/img/Hero-Glamour-3.jpg'),
                ),
              ),
              Text("Specifications",style: TextStyle(fontSize: 25),),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 98,
                    child: Card(
                      elevation:3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text("Gear:",style: TextStyle(
                          fontSize:20),
                      ),

                    ),
                  ),
                  Container(
                    height: 100,
                    width: 98,
                    child: Card(
                      elevation:3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text("Color:",style: TextStyle(fontSize: 20),),

                    ),
                  ),
                  Container(
                    height: 100,
                    width: 98,
                    child: Card(
                      elevation:3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text("seats:",style: TextStyle(fontSize: 20),),

                    ),
                  ),
                  Container(
                    height: 100,
                    width: 98,
                    child: Card(
                      elevation:3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text("Fuel:",style: TextStyle(fontSize: 20),),

                    ),
                  )

                ],
              ),
              SizedBox(
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(left:50.0,right: 50.0,top:10.0),
                child: Container(
                  width:100,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bokrent ()));
                  }, child: Text("book"),
                  ),
                ),
              )

            ]

        ),
      ),
    );
  }
}