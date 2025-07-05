import 'package:crop_guard/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/responsive/widget_height.dart';
import '../../../../../core/responsive/widget_width.dart';
import 'control_screen.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  ConnectionScreenState createState() => ConnectionScreenState();
}

class ConnectionScreenState extends State<ConnectionScreen> {
  final TextEditingController ipController =
      TextEditingController(text: '192.168.4.2');
  final TextEditingController portController =
      TextEditingController(text: '12345');
  bool isConnecting = false;

  Future<void> connect() async {
    setState(() {
      isConnecting = true;
    });
    try {
      String ip = ipController.text;
      int port = int.parse(portController.text);
      Socket socket =
          await Socket.connect(ip, port, timeout: const Duration(seconds: 10));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ControlScreen(socket: socket)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to connect: $e'),
          backgroundColor: AppColors.kDangerColor,
        ),
      );
    } finally {
      setState(() {
        isConnecting = false;
      });
    }
  }

  @override
  void dispose() {
    ipController.dispose();
    portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundGray,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          'Rover Control',
          style: AppTextStyles.font20WhiteBold,
        ),
        centerTitle: true,
        leading: IconButton(
          color: AppColors.kWhiteColor,
          onPressed: () {
            GoRouter.of(context).go(AppRouter.home);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WiFi Access Point',
              style: AppTextStyles.font28BlackBold,
            ),
            SizedBox(height: widgetHeight(context: context, height: 34)),
            TextField(
              controller: ipController,
              decoration: InputDecoration(
                labelText: 'IP Address',
                labelStyle: AppTextStyles.font14TextGrayRegular,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.kGrayColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.kGrayColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                      color: AppColors.kPrimaryColor, width: 2),
                ),
                filled: true,
                fillColor: AppColors.kCardWhite,
              ),
              style: AppTextStyles.font16BlackRegular,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: widgetHeight(context: context, height: 26)),
            TextField(
              controller: portController,
              decoration: InputDecoration(
                labelText: 'Port Number',
                labelStyle: AppTextStyles.font14TextGrayRegular,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.kGrayColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.kGrayColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                      color: AppColors.kPrimaryColor, width: 2),
                ),
                filled: true,
                fillColor: AppColors.kCardWhite,
              ),
              style: AppTextStyles.font16BlackRegular,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: widgetHeight(context: context, height: 40)),
            SizedBox(
              width: widgetWidth(context: context, width: 200),
              height: widgetHeight(context: context, height: 50),
              child: ElevatedButton(
                onPressed: isConnecting ? null : connect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 2,
                ),
                child: isConnecting
                    ? SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.kWhiteColor),
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Connect',
                        style: AppTextStyles.font18BlackBold.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
