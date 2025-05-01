import 'package:flutter/material.dart';
import 'widgets/delivery_details_tile.dart';
import 'widgets/delivery_info_header.dart';
import 'widgets/process_timeline.dart';
class OrderDeliveryInfoScreen extends StatelessWidget {
  const OrderDeliveryInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
              color: Colors.white,),),
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Delivery Info",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),


          )),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            DeliveryInfoHeader(),
            SizedBox(height: 16),
            DeliveryDetailsTile(),
            SizedBox(height: 16),
            Text(
              "Delivery Process",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Center(child: ProcessTimeline()),

          ],
        ),
      ),
    );
  }
}
