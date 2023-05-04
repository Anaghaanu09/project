import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bookingtrans.dart';

class Taxi extends StatefulWidget {
  const Taxi({Key? key}) : super(key: key);

  @override
  State<Taxi> createState() => TaxiState();
}

class TaxiState extends State<Taxi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Select TAXI "),

        centerTitle: true,
      ),


      body:ListView.separated(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                // color: Colors.cyanAccent,
                child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fyellow-taxi-car-model-isolated-white-168579445.jpg&tbnid=hnP-9fVk1dtZOM&vet=10COsBEDMowgFqFwoTCKj62u6Hof4CFQAAAAAdAAAAABAD..i&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Ftaxi.html&docid=kT0UkZVVi6aaXM&w=800&h=536&q=taxi%20image&ved=0COsBEDMowgFqFwoTCKj62u6Hof4CFQAAAAAdAAAAABAD")
              // decoration: BoxDecoration(
              // image: DecorationImage(
              // image: AssetImage(
              // 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'),
              // fit: BoxFit.fill,
              // ),
              // shape: BoxShape.circle,
              // ),
            ),
            title: Text("Taxi,${index+1}") ,
            subtitle: Text("Car"),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: (){
              //print("on tap pressed");
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