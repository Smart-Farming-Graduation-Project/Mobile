import 'package:crop_guard/featurs/profile/views/widgets/text_box.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/widgets/custom_button.dart';

import '../../../core/utils/theme/app_colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(

          children: [

            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                        children:[
                          SizedBox(
                            height: 100,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image(image: AssetImage('assets/images/home/profile.png')),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColors.kWhiteColor),

                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: AppColors.kPrimaryColor),
                              child: Icon(FontAwesomeIcons.pen,
                                color: AppColors.kWhiteColor,
                                size: 20,),
                            ),
                          ),
                        ]

                    ),
                   ],
                ),
              ),
            ),
            TextBox1(name: 'Name'),
            SizedBox(height: 15,),
            TextBox1(name: 'Email Address'),
            SizedBox(height: 15,),
            TextBox1(name: 'Mobile Number'),
            SizedBox(height: 15,),
            TextBox1(name: 'Enter Address'),
            SizedBox(height: 230,),
            CustomButton(buttoncolor: AppColors.kPrimaryColor,
                buttonwidth: 50,
                buttonheight: 60,
                buttontext: 'Update', textcolor:AppColors.kWhiteColor)

          ],
        ),
      ),

    );
  }
}
