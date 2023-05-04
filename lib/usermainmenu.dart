import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehiclesportal/rentaluser.dart';
import 'package:vehiclesportal/transportation.dart';
import 'package:vehiclesportal/userfeedback.dart';

import 'bookings.dart';
import 'locationuser.dart';
import 'notification.dart';
import 'notificationuser.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Get start"),
           centerTitle: true,
          leading: Icon(
              Icons.home
          ),
          actions: [Icon(   Icons.more_vert,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Locations()));
                }, child: Text("YOUR LOCATION"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Vehicle()));
                }, child: Text("RENTAL VEHICLE"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Vehicles()));
                }, child: Text("TRANSPORTATION "),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> notfi()));
                }, child: Text("NOTIFICATION"),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Payment()));
                }, child: Text("PAYMENT"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Feedbackaa()));
                }, child: Text("FEEDBACK"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> booking()));
                }, child: Text("BOOKINGS"),
                ),
              ),


            ],

          ),
        )
    );
  }
}