import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsmg/providers/name.dart';
import 'package:provider/provider.dart';
// import 'package:game_messenger_app/constants.dart';

class PersonalChatTextField extends StatefulWidget {
  PersonalChatTextField({Key? key, required ScrollController this.sc})
      : super(key: key);
  final ScrollController sc;

  @override
  State<PersonalChatTextField> createState() => _PersonalChatTextFieldState();
}

class _PersonalChatTextFieldState extends State<PersonalChatTextField> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController msg = TextEditingController();

  TextEditingController name = TextEditingController();

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
      height: 103.46,
      child: SafeArea(
        child: Form(
          key: _formkey,
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
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: msg,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "message can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Type something...',
                            border: InputBorder.none),
                      ),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "name can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: ' name...',
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    await FirebaseFirestore.instance
                        // .collection('users')
                        // .doc(_authProvider.theUser!.uid)
                        // .set(_generalUser.toMap(), SetOptions(merge: true));
                        .collection('chatv2')
                        .add({
                      'msg': msg.value.text,
                      "name": name.value.text,
                      'date': DateTime.now(),
                    }).catchError((e) => debugPrint(e.toString()));
                    widget.sc.jumpTo(widget.sc.position.maxScrollExtent);
                    setState(() {
                      msg.clear();
                    });
                    Provider.of<NameProvider>(context, listen: false)
                        .changeName(name.value.text);
                  }
                },
                icon: const Icon(Icons.send),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
