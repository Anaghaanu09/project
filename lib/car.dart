import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vehiclesportal/view.dart';

import 'const.dart';

class car extends StatefulWidget {
  const car({Key? key}) : super(key: key);

  @override
  State<car> createState() => _carState();
}

class _carState extends State<car> {


  Future<dynamic> getData() async {
    print('object');
    var response = await get(Uri.parse('${Con.url}viewrental.php'));
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select car",style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFF84EE9),
        centerTitle: true,
        leading:Icon(

          Icons.arrow_back,
          color: Colors.black,
        ),
      ),

      body:FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('null'));
            } else if (snapshot.data[0]['message'] == 'failed') {
              return Center(child: Text('not yet ordered'));
            }
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network('https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg'),
                      title: Text(snapshot.data![index]['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('price:${snapshot.data![index]['price']}'),
                          // Text('delivery time${snapshot.data![index]['delivery_time']}'),
                          // Text('price:${snapshot.data![index]['price']}'),
                          // Text('date:${snapshot.data![index]['order_date']}'),
                          // Text('Extra Text 2'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        print("on tap pressed");
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return view(id: '${snapshot.data![index]['rental_id']}');
                        },),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );


          }),
    );
  }
}