import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsmg/models/chatmodel.dart';
import 'package:gsmg/widgets/personal_chat_app_bar.dart';
import 'package:gsmg/widgets/personal_chat_text_field.dart';
import 'package:intl/intl.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PersonalChatAppBar(),
        body: Column(
          children: [
            // ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (BuildContext context, int index) {
            //     return;
            //   },
            // ),
            Expanded(
              child: Container(
                //height: 150,
                color: Colors.white,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('chatv2')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('error');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Text('empty');
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      List<DocumentSnapshot> _docs = snapshot.data!.docs;

                      List<ChatModel> _users = _docs
                          .map((e) => ChatModel.fromMap(
                              e.data() as Map<String, dynamic>))
                          .toList();
                      // _users = _users.sort((a, b) {
                      //   //sorting in ascending order
                      //   return DateTime.parse(a.date.toString())
                      //       .compareTo(DateTime.parse(b.date.toString()));
                      // });
                      // List<ChatModel> _users = _docs.map((e) {e["msg"]).toList();
                      //(e.data() as Map<String, dynamic>)
                      return ListView.builder(
                          itemCount: _users.length,
                          itemBuilder: (context, index) {
                            //return Text(_users[index] ?? 'no name');
                            return Container(
                              color: Colors.cyan[50],
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(_users[index].msg),
                                  Divider(),
                                  Text(_users[index].date.toDate().toString()),
                                ],
                              ),
                            );
                          });
                    }
                    return LinearProgressIndicator();
                  },
                ),
              ),
            ),
            PersonalChatTextField()
            // Expanded(
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: TextField(
            //           controller: msg,
            //         ),
            //       ),
            //       Expanded(
            //         child: ElevatedButton(
            //           onPressed: () async {
            //             await FirebaseFirestore.instance
            //                 // .collection('users')
            //                 // .doc(_authProvider.theUser!.uid)
            //                 // .set(_generalUser.toMap(), SetOptions(merge: true));
            //                 .collection('chat')
            //                 .add({
            //               'msg': msg.value.text,
            //             }).catchError((e) => debugPrint(e.toString()));
            //           },
            //           child: Text("send"),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
