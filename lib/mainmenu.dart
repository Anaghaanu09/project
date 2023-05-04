import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehiclesportal/login.dart';
import 'package:vehiclesportal/payment.dart';

import 'addrental.dart';
import 'addtransportation.dart';
import 'feedback.dart';
import 'notification.dart';

class Mainmenu1 extends StatefulWidget {
  const Mainmenu1({Key? key}) : super(key: key);

  @override
  State<Mainmenu1> createState() => _Mainmenu1State();
}

class _Mainmenu1State extends State<Mainmenu1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
        centerTitle: true,
        leading: Icon(
            Icons.home
        ),
        actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
               onTap:(){
                 Fluttertoast.showToast(msg: 'Logout successfully...');
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Homelog()));
               },
               child: Icon(Icons.logout)),
         )
       ],
        ),
      
    
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Addrental()));
            },  style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
                onPrimary: Colors.white),child: Text("ADD RENTAL"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Addtrans()));
            },  style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
                onPrimary: Colors.white),child: Text("ADD TRANSPORTATION "),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> notfy()));
            },  style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
                onPrimary: Colors.white),child: Text("NOTIFICATION"),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> payment()));
            },
              style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
                 onPrimary: Colors.white),
    child: Text("PAYMENT"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> feedback()));
            },  style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
                onPrimary: Colors.white),child: Text("Feedback"),
            ),
          ),



          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton(onPressed: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainmenu()));
          //   },  style:ElevatedButton.styleFrom(primary: Colors.blueGrey,
          //       onPrimary: Colors.white),child: Text("MY PROFILE"),
          //   ),
          // ),

        ],

      ),
    );
  }
}
