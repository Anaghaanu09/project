import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bookingtrans.dart';

class Truck extends StatefulWidget {
  const Truck({Key? key}) : super(key: key);

  @override
  State<Truck> createState() => TruckState();
}

class TruckState extends State<Truck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Select Truck "),

        centerTitle: true,
      ),


      body:ListView.separated(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                // color: Colors.cyanAccent,
                child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.mahindratruckandbus.com%2Fenglish%2Fimages%2Fhcv%2Fhaulage%2Fblazo-x-35%2Fblazo-x-35.jpg&tbnid=WAULJp897voj5M&vet=12ahUKEwjbz8q1iKH-AhUvHrcAHcF0CnwQMygLegUIARCBAg..i&imgrefurl=https%3A%2F%2Fwww.mahindratruckandbus.com%2Fenglish%2Fheavy-commercial-vehicles%2Fmultiaxle-rigid-trucks.aspx&docid=_axp30XGFeXFUM&w=463&h=302&q=truck%20image&ved=2ahUKEwjbz8q1iKH-AhUvHrcAHcF0CnwQMygLegUIARCBAg")
              // decoration: BoxDecoration(
              // image: DecorationImage(
              // image: AssetImage(
              // 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'),
              // fit: BoxFit.fill,
              // ),
              // shape: BoxShape.circle,
              // ),
            ),
            title: Text("TRUCK,${index+1}") ,
            subtitle: Text("Load King"),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: (){
              print("on tap pressed");
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Bok()));
            },
          ),
        );
      },
          separatorBuilder: (context,index) {
            return Divider();
          },
          itemCount: 10),
    );
  }
}