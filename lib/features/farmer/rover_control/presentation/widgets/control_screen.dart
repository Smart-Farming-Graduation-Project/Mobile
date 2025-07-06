import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/responsive/widget_height.dart';
import '../../../../../core/responsive/widget_width.dart';
import 'direction_button.dart';

class ControlScreen extends StatefulWidget {
  final Socket socket;

  const ControlScreen({super.key, required this.socket});

  @override
  ControlScreenState createState() => ControlScreenState();
}

class ControlScreenState extends State<ControlScreen> {
  bool isConnected = true;
  double speed = 0;
  Timer? keepAliveTimer;

  @override
  void initState() {
    super.initState();
    startKeepAlive();
    widget.socket.listen(
      (data) {
        log('Received data: ${String.fromCharCodes(data)}');
      },
      onError: (error) {
        disconnect();
      },
      onDone: () {
        disconnect();
      },
    );
  }

  void startKeepAlive() {
    keepAliveTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (isConnected) {
        try {
          widget.socket.write('K');
        } catch (e) {
          log('Error in keep-alive: $e');
          disconnect();
        }
      } else {
        timer.cancel();
      }
    });
  }

  void disconnect() {
    if (!isConnected) return; // Prevent multiple disconnect attempts
    setState(() {
      isConnected = false;
    });
    keepAliveTimer?.cancel();
    widget.socket.close();
    if (mounted) {
      GoRouter.of(context).pop();
    }
  }

  void sendCommand(String command) {
    if (isConnected) {
      try {
        widget.socket.write(command);
      } catch (e) {
        log('Error sending command: $e');
        disconnect();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not connected'),
          backgroundColor: AppColors.kDangerColor,
        ),
      );
    }
  }

  @override
  void dispose() {
    keepAliveTimer?.cancel();
    if (isConnected) widget.socket.close(); // Only close if still connected
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default back button behavior
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          disconnect(); // Custom disconnect logic
        }
      },
      child: Scaffold(
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
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Icon(
                Icons.circle,
                color: isConnected
                    ? AppColors.kGreenColor // Green for connected
                    : AppColors.kDangerColor, // Red for disconnected
                size: 25.w,
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Rover Control Section
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kGrayColor.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Rover Control',
                          style: AppTextStyles.font16BlackBold,
                        ),
                        SizedBox(
                            height: widgetHeight(context: context, height: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 80)),
                            DirectionButton(
                              icon: Icons.arrow_upward,
                              onPressed: () => sendCommand('F'),
                              onReleased: () => sendCommand('S'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 80)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DirectionButton(
                              icon: Icons.arrow_back,
                              onPressed: () => sendCommand('L'),
                              onReleased: () => sendCommand('S'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 80)),
                            DirectionButton(
                              icon: Icons.arrow_forward,
                              onPressed: () => sendCommand('R'),
                              onReleased: () => sendCommand('S'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 80)),
                            DirectionButton(
                              icon: Icons.arrow_downward,
                              onPressed: () => sendCommand('B'),
                              onReleased: () => sendCommand('S'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 80)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 30)),
                  // Speed Control Section
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Text(
                          'Speed Control',
                          style: AppTextStyles.font16BlackSemiBold,
                        ),
                        SizedBox(height: 10.h),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.kPrimaryColor,
                            inactiveTrackColor: AppColors.kGrayColor,
                            thumbColor: AppColors.kPrimaryColor,
                            overlayColor:
                                AppColors.kPrimaryColor.withValues(alpha: 0.2),
                            valueIndicatorColor: AppColors.kPrimaryColor,
                            valueIndicatorTextStyle:
                                AppTextStyles.font14BlackBold.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          child: Slider(
                            value: speed,
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: speed.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                speed = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: widgetWidth(context: context, width: 150),
                    height: widgetHeight(context: context, height: 45),
                    child: ElevatedButton(
                      onPressed: () {
                        sendCommand(speed.round().toString());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Set Speed',
                        style: AppTextStyles.font16WhiteBold,
                      ),
                    ),
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 25)),
                  // Camera Control Section
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kGrayColor.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Camera Control',
                          style: AppTextStyles.font16BlackBold,
                        ),
                        SizedBox(
                            height: widgetHeight(context: context, height: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 60)),
                            DirectionButton(
                              icon: Icons.keyboard_arrow_up,
                              onPressed: () => sendCommand('U'),
                              onReleased: () => sendCommand('T'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 60)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DirectionButton(
                              icon: Icons.keyboard_arrow_left,
                              onPressed: () => sendCommand('O'),
                              onReleased: () => sendCommand('T'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 30)),
                            Container(
                              width: widgetWidth(context: context, width: 50),
                              height:
                                  widgetHeight(context: context, height: 50),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(25.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.kPrimaryColor
                                        .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () => sendCommand('C'),
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.kWhiteColor,
                                  size: 25.w,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 30)),
                            DirectionButton(
                              icon: Icons.keyboard_arrow_right,
                              onPressed: () => sendCommand('J'),
                              onReleased: () => sendCommand('T'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 60)),
                            DirectionButton(
                              icon: Icons.keyboard_arrow_down,
                              onPressed: () => sendCommand('D'),
                              onReleased: () => sendCommand('T'),
                            ),
                            SizedBox(
                                width:
                                    widgetWidth(context: context, width: 60)),
                          ],
                        ),
                        SizedBox(
                            height: widgetHeight(context: context, height: 10)),
                        Text(
                          'Tap camera icon to capture',
                          style: AppTextStyles.font14GreyRegular,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 40)),
                  SizedBox(
                    width: widgetWidth(context: context, width: 200),
                    height: widgetHeight(context: context, height: 50),
                    child: ElevatedButton(
                      onPressed: disconnect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kDangerColor,
                        foregroundColor: AppColors.kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Disconnect',
                        style: AppTextStyles.font18BlackBold.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
