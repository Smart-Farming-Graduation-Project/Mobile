import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/featurs/categories/presentation/models/product_model.dart';
import 'package:flutter/material.dart';

class SellerInfoTile extends StatelessWidget {
  final SellerModel seller;

  const SellerInfoTile({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth(context: context, width: 180),
      child: Card(
        child: ExpansionTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: Row(
            children: [
              CircleAvatar(
                radius: 22,
                child: Image.asset(seller.image),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  seller.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                seller.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.5,fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
