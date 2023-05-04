import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'const.dart';

class Bike extends StatefulWidget {
  const Bike({Key? key}) : super(key: key);

  @override
  State<Bike> createState() => BikeState();
}

class BikeState extends State<Bike> {
  Future<dynamic> getData() async {
    var response = await get(Uri.parse('${Con.url}viewrentalb.php'));
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Bike "),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data![0]['message'] == 'failed') {
            return Center(child: Text("No items"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                // return buildBikeCard(snapshot.data[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildBikeCard(dynamic bikeData) {
    return Card(
      color: Colors.blueGrey.shade200,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildBikeImage(),
            SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  buildBikeName(bikeData['name']),
                  buildBikePrice(bikeData['price']),
                  buildSelectButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBikeImage() {
    return Container(
      height: 80,
      width: 80,
      child: Image.asset("lib/assets/img/Pulsar-125-AmbaBajaj1.webp"),
    );
  }

  Widget buildBikeName(String name) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        text: name,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget buildBikePrice(String price) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        text: 'Price: $price',
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget buildSelectButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const viewb()),
          // );
        },
        child: const Text("Select"),
      ),
    );
  }
}
