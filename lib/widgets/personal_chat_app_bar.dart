import 'package:flutter/material.dart';
// import 'package:game_messenger_app/constants.dart';

class PersonalChatAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PersonalChatAppBar({Key? key}) : super(key: key);

  // The name should be retrived from the data model that containes the list contact names

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
      ),
      title: Column(
        children: [
          Image.asset(
            "chat.png",
            width: 20,
            height: 20,
          ),
          const Text(
            "Chat screen ",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      titleSpacing: -7,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // This neccessary don't Touch it
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
