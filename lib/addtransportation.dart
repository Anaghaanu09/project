import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'const.dart';

class Addtrans extends StatefulWidget {
  const Addtrans({Key? key}) : super(key: key);

  @override
  State<Addtrans> createState() => _AddtransState();
}

class _AddtransState extends State<Addtrans> {



  var vehicle = TextEditingController();
  var location = TextEditingController();
  var RC = TextEditingController();
  var insurance = TextEditingController();
  var driving_licence = TextEditingController();
  var upload_photo = TextEditingController();

  Future<void> getData() async {
    var data = {
      "type_of_vehicle": vehicle.text,
      "location": location.text,
      "RC": RC.text,
      "insurance": insurance.text,
      "driving_licence": driving_licence.text,
      "upload_photo": upload_photo.text,

    };
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
    var response = await post(Uri.parse('${Con.url}add transportation.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'added') {
        const snackBar = SnackBar(content: Text("successfully"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Fluttertoast.showToast(msg: 'Successfully added...');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Addtrans();
        }
        ));
      }
      else {
        Fluttertoast.showToast(msg: 'Invalid ');
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transportation Vehicles"),
        centerTitle: true,

      ),
      body: Center(
        child:ListView(

          children:[
            Expanded(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('ADD transportation vehicles', style:  TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,)),
            )),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: vehicle,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Type of vehicle",hintText: "enter your vehicle type"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: location,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Location",hintText: "enter your Location"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: RC,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "RC",hintText: "enter your RC no:"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: insurance,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Insurance",hintText: "enter your policy no;"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller:driving_licence ,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "driving licencd",hintText: "enter your licence no"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: upload_photo,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Upload photo",hintText: "Upload file"
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              getData();
            }, child: Text("ADD"))

          ],
        ),
      ),

    );
  }
}
