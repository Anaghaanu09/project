import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  Future<dynamic> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('regi_id');
    var data={
      "id":sp
    };
    
    var response = await post(Uri.parse('${Con.url}profile.php'),body:data);
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""),
      // ),
      body: 
    SafeArea(
          child: FutureBuilder(
            future: getData(),
            builder: (context,snapshot) {
              if(!snapshot.hasData){
                return Center(child:CircularProgressIndicator());
              }
              else if(snapshot.data[0]['message']=='Failed') {
                    return Center(child: Text('No Place Available')); 
              }
              else{
              return  Expanded(
                child: ListView(
                      children: [
                     Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Name:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Flexible(
        child: Text(
          snapshot.data![0]['first_name'],
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
        ),
      ),
    ],
  ),
),

                      Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Street Address:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Flexible(
        child: Text(snapshot.data![0]['street_address'],
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
        ),
      ),
    ],
  ),
),




  Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        "City:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Flexible(
        child: Text(
          snapshot.data![0]['city'],
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
        ),
      ),
    ],
  ),
),

                      
 Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "State:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Flexible(
        child: Text(
          snapshot.data![0]['state'],
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
        ),
      ),
    ],
  ),
),
  ],
                    
                  
 ),
  );
 }
 }
          ),
        ),
    );
    }
 }