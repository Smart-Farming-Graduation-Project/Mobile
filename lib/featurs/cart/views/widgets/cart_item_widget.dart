import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartProduct cartItem;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.18,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ]),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        elevation: 2,
        color: const Color(0xFFF4F4F4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          leading: Image.network(
            cartItem.imageUrl,
            width: 70,
            height: 70,
          ),
          title: Text(cartItem.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.category,
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("\$${cartItem.currentPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 5),
                  if (cartItem.currentPrice != cartItem.originalPrice)
                    Text("\$${cartItem.originalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),
                ],
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {}),
              Text(cartItem.quantity.toString(),
                  style: const TextStyle(fontSize: 18)),
              IconButton(
                  icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
