import 'dart:convert';

    
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclesportal/usermainmenu.dart';

import 'const.dart';

class Viewpro extends StatelessWidget {
  const Viewpro({Key? key}) : super(key: key);

  static const String _title = 'View Profile';

  Future<dynamic> profileView() async {
    SharedPreferences spref=await SharedPreferences.getInstance();
    var sp=spref.getString('reg_id');
    var data={
      "id":sp,
    };
    // SharedPreferences spref = await SharedPreferences.getInstance();
    // var sp = spref.getString('regi_id');
    // print(sp);

    // var data = {
    //   "id": sp,
    // };
    print('>>>>>>>>>>>>>>>>>>>>$data');

    var response = await post(Uri.parse('${Con.url}profile.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(_title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mainmenu()));
          },
        ),
      ),
      body: FutureBuilder(
        future: profileView(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data[0]['message'] == 'failed') {
            return Center(child: Text('no data'));
          } else {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Firstname:'),
                    Text(snapshot.data![0]['first_name']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('street address'),
                    Text(snapshot.data![0]['street_address']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('city'),
                    Text(snapshot.data![0]['city']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('state'),
                    Text(snapshot.data![0]['state']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('phone number'),
                    Text(snapshot.data![0]['phone_number']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('email'),
                    Text(snapshot.data![0]['Email']),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}