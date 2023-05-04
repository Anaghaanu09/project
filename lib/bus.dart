import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bookingtrans.dart';
class Bus extends StatefulWidget {
  const Bus({Key? key}) : super(key: key);

  @override
  State<Bus> createState() => BusState();
}

class BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Select Bus "),

        centerTitle: true,
      ),


      body:ListView.separated(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                // color: Colors.cyanAccent,
                child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.bajajauto.com%2F-%2Fmedia%2FAssets%2Fbajajauto%2Fthree-wheelers%2Fre%2FCalculator_image%2Fsavings_calculator_image_re_new.ashx&imgrefurl=https%3A%2F%2Fwww.bajajauto.com%2Fthree-wheelers%2Fre&tbnid=As1JgGH2YsZJfM&vet=12ahUKEwiSxrWx3d39AhXlitgFHTvMD3MQMygCegUIARDlAQ..i&docid=CqXYDIt7PThl6M&w=780&h=658&itg=1&q=auto%20image&ved=2ahUKEwiSxrWx3d39AhXlitgFHTvMD3MQMygCegUIARDlAQ")
              // decoration: BoxDecoration(
              // image: DecorationImage(
              // image: AssetImage(
              // 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'),
              // fit: BoxFit.fill,
              // ),
              // shape: BoxShape.circle,
              // ),
            ),
            title: Text("Bus,${index+1}") ,
            subtitle: Text("Bus"),
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
          itemCount: 40),
    );
  }
}