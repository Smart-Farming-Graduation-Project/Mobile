
import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_text_styles.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only()
      ),
      child:  SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/home/profile.png',
                ),
              ),
            ),
            const SizedBox(width: 20,),
        
            Column(
              children: [
                Text('Menna Fouda',style: AppTextStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold, )
                ),
                const Text('mennafouda@gmail.com',style:TextStyle( fontSize: 14,color: Colors.grey  ),)
              ],
            ),
        
        
          ],
        ),
      ),
    );
  }
}
