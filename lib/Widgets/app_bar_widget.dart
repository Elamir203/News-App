import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:  IconThemeData(color: Colors.black , size: 30),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('News',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          Text('Cloud',style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
