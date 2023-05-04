import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bookingtrans.dart';

class Auto extends StatefulWidget {
  const Auto({Key? key}) : super(key: key);

  @override
  State<Auto> createState() => AutoState();
}

class AutoState extends State<Auto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Select Auto "),

        centerTitle: true,
      ),


      body:ListView.separated(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                // color: Colors.cyanAccent,
                child: Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.zeebiz.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fzeebiz_850x478%2Fpublic%2F2016%2F04%2F19%2F517-bajaj-auto.png%3Fitok%3DIuFmLOqS&tbnid=vKkpVEm5KhL3VM&vet=12ahUKEwihiOzdiKH-AhXZ-XMBHdfECZUQMygUegUIARCOAg..i&imgrefurl=https%3A%2F%2Fwww.zeebiz.com%2Fcompanies%2Fnews-bajaj-auto-targets-17-growth-for-three-wheelers-this-fiscal-337&docid=rWYawUMyL6TaMM&w=850&h=477&q=auto%20image&ved=2ahUKEwihiOzdiKH-AhXZ-XMBHdfECZUQMygUegUIARCOAg")
              // decoration: BoxDecoration(
              // image: DecorationImage(
              // image: AssetImage(
              // 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'),
              // fit: BoxFit.fill,
              // ),
              // shape: BoxShape.circle,
              // ),
            ),
            title: Text("Auto,${index+1}") ,
            subtitle: Text("list"),
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