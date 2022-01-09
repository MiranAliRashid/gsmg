import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (BuildContext context, int index) {
            //     return;
            //   },
            // ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: msg,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            // .collection('users')
                            // .doc(_authProvider.theUser!.uid)
                            // .set(_generalUser.toMap(), SetOptions(merge: true));
                            .collection('chat')
                            .add({
                          'msg': msg.value.text,
                        }).catchError((e) => debugPrint(e.toString()));
                      },
                      child: Text("send"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
