import 'dart:convert';
import 'dart:html';
//import 'dart:html';
//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'const.dart';
import 'imagede.dart';
//import 'imagede.dart';

class Addrental extends StatefulWidget {
  const Addrental({Key? key}) : super(key: key);

  @override
  State<Addrental> createState() => _AddrentalState();
}

class _AddrentalState extends State<Addrental> {
    XFile? pickedFile;
  File? image;

  File? pickedImage;

  
  var vehicle = TextEditingController();
  var gear = TextEditingController();
  var color = TextEditingController();
  var seat = TextEditingController();
  var fuel = TextEditingController();
  var location = TextEditingController();
  var RC = TextEditingController();
  var insurance = TextEditingController();
  var driving_licence = TextEditingController();
  var upload_photo = TextEditingController();

  Future<void> getData() async {
  var data = {
  "type_of_vehicle": vehicle.text,
    "type_of_gear": gear.text,
    "color_of_vehicle": color.text,
    "seats_of_vehicle": seat.text,
    "fuel_of_vehicle": fuel.text,
  "location": location.text,
  "RC": RC.text,
  "insurance": insurance.text,
  "driving_licence": driving_licence.text,
  //"upload_photo":image!.path,

  };
  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
  var response = await post(Uri.parse('${Con.url}add rental.php'), body: data);
  print(response.body);
  if (response.statusCode == 200) {
  var res = jsonDecode(response.body)["message"];
  if (res == 'successfully added') {
   const snackBar = SnackBar(content: Text("successfully added"),
   );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
   // Fluttertoast.showToast(msg: 'Successfully added...');
  Navigator.push(context, MaterialPageRoute(builder: (context) {
  return Addrental();
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
        title: Text("Add Rental Vehicles"),
centerTitle: true,

        actions: [
        ],
      ),
      body: Center(
      child: ListView(
        children:[
          // Expanded(child: Text('ADD rental vehicles', style:  TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),
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
                controller: gear,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "gear",hintText: "enter type of gear"
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: color,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "vehicle",hintText: "enter color of vehicle"
                ),
              ),
            ),
          ),Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: seat,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "seat",hintText: "enter number of seats"
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: fuel,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "fuel",hintText: "enter fuel"
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
                controller: driving_licence,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "driving licence",hintText: "enter your licence no"
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                onTap: () async {
                              File? temp = await Services.pickImage(context);
                              setState(() {
                                pickedImage = temp;
                              });
                              print(pickedImage!.path);
                            },
                            
                
                
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