import 'package:crop_guard/features/ecommerce/home/presentation/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theme/app_colors.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({
    super.key,
    required this.appbarName,
  });
  final String appbarName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0,
      title: Text(
        appbarName,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins'),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.read<HomeCubit>().changePage(0);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
