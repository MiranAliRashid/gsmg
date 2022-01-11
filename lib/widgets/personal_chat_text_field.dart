import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:game_messenger_app/constants.dart';

class PersonalChatTextField extends StatelessWidget {
  PersonalChatTextField({Key? key}) : super(key: key);
  TextEditingController msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 4),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 83.46,
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: const Color(0xffF7F7FC),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: msg,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Type something...',
                      border: InputBorder.none),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    // .collection('users')
                    // .doc(_authProvider.theUser!.uid)
                    // .set(_generalUser.toMap(), SetOptions(merge: true));
                    .collection('chatv2')
                    .add({
                  'msg': msg.value.text,
                  'date': DateTime.now(),
                }).catchError((e) => debugPrint(e.toString()));
              },
              icon: const Icon(Icons.send),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
