import 'package:crop_guard/featurs/cart/manger/cubit/cart_cubit.dart';
import 'package:crop_guard/featurs/cart/manger/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  splashRadius: 1,
                  icon: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context.read<CartCubit>().removeItem(cartItem.id);
                  },
                ),
              ),
            )
          ]),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        elevation: 0,
        color: Colors.transparent,
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
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.category,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 245, 204, 143),
                      fontWeight: FontWeight.w600)),
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
                  onPressed: () {
                    context.read<CartCubit>().updateQuantity(
                          cartItem.id,
                          cartItem.quantity,
                          false,
                        );
                  }),
              Text(cartItem.quantity.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    context.read<CartCubit>().updateQuantity(
                          cartItem.id,
                          cartItem.quantity,
                          true,
                        );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
