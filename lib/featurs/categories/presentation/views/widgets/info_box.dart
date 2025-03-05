import 'package:crop_guard/core/responsive/widget_width.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const InfoBox({required this.icon, required this.text, required this.iconColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(height: 4),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
class InfoBoxDetails extends StatelessWidget {
  const InfoBoxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: widgetWidth(context: context, width: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 3,
              color: Colors.grey.shade300,

            ),
          ],
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            InfoBox(icon: Icons.local_shipping, text: "\$2.00", iconColor: AppColors.kOrangeColor),
            InfoBox(icon: Icons.location_on, text: "2.4 km", iconColor: AppColors.kPrimaryColor),
            InfoBox(icon: Iconsax.money5, text: "No Offer", iconColor:AppColors.kDangerColor),
          ],
        ),
      ),
    );
  }
}
