import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Slidable(
            endActionPane: ActionPane(
                extentRatio: .4,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(onPressed: (context){},
                    icon: Icons.delete,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red ,)
                ]
            ),
            child:const  ListTile(
              leading: CircleAvatar(
                radius: 27,
                  backgroundColor: Color(0XFFCAFFC8),
                  child: Icon(Icons.notifications,color: AppColors.kPrimaryColor,)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Orders',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('2h Ago',style: TextStyle(fontSize: 14))
                ],

              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('order collection date',style: TextStyle(fontWeight: FontWeight.w700),),
                Text('order collection date any thing  any thing  any thing any thing any thing any thing any thing',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),

                ],
              ),
            ),
          ),
        );
      }, 
          separatorBuilder: (context,index){
            return const Divider(thickness: 1,
            color: AppColors.kGrayColor);
          },
          itemCount: 15),

    );
  }
}
