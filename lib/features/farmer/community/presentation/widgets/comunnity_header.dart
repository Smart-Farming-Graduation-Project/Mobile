
import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/core/routes/app_router.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComunnityHeader extends StatelessWidget {
  const ComunnityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5,),
      child: Row(
        children: [
          const UserImage(radius: 25,),
          const SizedBox(
            width: 10,
          ),

          GestureDetector(
            onTap: () {
             GoRouter.of(context).push(AppRouter.createpost);
            },
            child: Container(
              width:widgetWidth(context: context, width: 290 ),
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade500,
                width: 1.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Create Post',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(Icons.edit, color: Colors.grey[600]),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
