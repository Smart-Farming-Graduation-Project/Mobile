import 'package:crop_guard/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../models/recommended_model.dart';

class ItemCard extends StatefulWidget {
   const ItemCard({super.key, required this.item});
  final RecommendedModel item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
   IconData fav=Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                },
                child: Icon(fav, color: Colors.red,
                  ),
              ),
            ),
            Center(
              child: Image.asset(widget.item.imageUrlrecommended, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item.namerecommended,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'Poppins'),
            ),
            Text(
              widget.item.categoryrecommended,
              style: TextStyle(color: Colors.grey[600], fontSize: 16,fontFamily: 'Poppins'),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.pricerecommended,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Poppins'),
                ),
                 GestureDetector(
                   onTap: (){},
                   child: const CircleAvatar(
                    backgroundColor: AppColors.kPrimaryColor,
                    radius: 16,
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                                   ),
                 )
              ],
            ),
          ],
        ),
      ),
    );
  }
}