import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'const.dart';

class Bok extends StatefulWidget {
  const Bok({Key? key}) : super(key: key);

  @override
  State<Bok> createState() => _BokState();
}

class _BokState extends State<Bok> {
  final name=TextEditingController();
  final phno=TextEditingController();
  final address=TextEditingController();
  final from=TextEditingController();
  final to=TextEditingController();
  final vehicle=TextEditingController();
  final payment=TextEditingController();

  Future<void> getData() async {
    var response= await post(Uri.parse('${Con.url}booking.php'));
    var res= jsonDecode(response.body);
    print(res);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOKING DETAILS"),
        centerTitle: true,
      ),
      body:Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"Name",hintText: "Name ",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: phno,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"Phone no",hintText: "Phone no ",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"Address",hintText: "Address ",
                  ),
                 // keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: from,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"From",hintText: "From",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: to,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"destination",hintText: "destination",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"Date",hintText: "Date",
                  ),
                  
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText:"Time",hintText: "Time ",
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: vehicle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText:"Vehicle",hintText: "Vehicle",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: payment,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30.0),

                    ),
                    labelText:"Payment",hintText: "Payment",
                  ),
                  //keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left:80.0,right: 20.0,top:10.0),
            //   child: Container(
            //     width: 100,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //         ),
            //         labelText:"Password",hintText: "Password",
            //       ),
            //       obscureText: true,
            //     ),            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                      getData();
                }, child: Text("Submit"))
            ),
          ],
        ),
      ),
    );
  }
}