import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/featurs/cart/manger/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartProductModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
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
                  Slidable.of(context)?.close();
                  // context.read<CartCubit>().removeItem(cartItem.id);
                },
              ),
            ),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(128),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          leading: Image.network(
            cartItem.productImage,
            width: 70,
            height: 70,
          ),
          title: Text(cartItem.productName,
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 19)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.productDescription,
                  style: const TextStyle(
                      color: AppColors.kGrayColor,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("\$${cartItem.productPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  // const SizedBox(width: 5),
                  // if (cartItem.currentPrice != cartItem.originalPrice)
                  //   Text("\$${cartItem.originalPrice.toStringAsFixed(2)}",
                  //       style: const TextStyle(
                  //           decoration: TextDecoration.lineThrough,
                  //           color: Colors.grey)),
                ],
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(Icons.remove_circle_outline,
                      color: Colors.red),
                  onPressed: () {
                    // context.read<CartCubit>().updateQuantity(
                    //       cartItem.id,
                    //       cartItem.quantity,
                    //       false,
                    //     );
                  }),
              Text(cartItem.quantity.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  icon:
                      const Icon(Icons.add_circle_outline, color: Colors.green),
                  onPressed: () {
                    // context.read<CartCubit>().updateQuantity(
                    //       cartItem.id,
                    //       cartItem.quantity,
                    //       true,
                    //     );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
