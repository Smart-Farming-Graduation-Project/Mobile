import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';

import 'community_body.dart';
import 'widgets/navigation_bar.dart';

class CommunityHomeScreen extends StatefulWidget {
  const CommunityHomeScreen({super.key});

  @override
  State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  int _selectedIndex = 0;
  final PostCubit _postCubit = PostCubit();

  @override
  void initState() {
    super.initState();
    _postCubit.fetchAllPosts();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) _postCubit.fetchAllPosts();
  }

  String get _appBarTitle => ['Community', 'Profile'][_selectedIndex];

  @override
  void dispose() {
    _postCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _postCubit,
      child: Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        appBar: AppBar(
          title: Text(
            _appBarTitle,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: CommunityBody(
          index: _selectedIndex,
          postCubit: _postCubit,
        ),
        bottomNavigationBar: CommunityBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
