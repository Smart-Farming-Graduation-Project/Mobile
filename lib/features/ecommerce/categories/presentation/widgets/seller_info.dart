import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/widgets/sellers_list.dart';
import 'package:flutter/material.dart';

class SellerInfoTile extends StatelessWidget {
  final String sellerName;

  const SellerInfoTile({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth(context: context, width: 180),
      child: Card(
        child: ExpansionTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: Row(
            children: [
              CircleAvatar(
                radius: 22,
                child: Image.asset(sellersList[0].image),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  sellerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                sellersList[0].description,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1.5,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
