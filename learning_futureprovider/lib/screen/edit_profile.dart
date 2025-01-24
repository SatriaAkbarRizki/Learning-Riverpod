import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_futureprovider/model/user.dart';
import 'package:learning_futureprovider/screen/home.dart';
import 'package:learning_futureprovider/service/user_service.dart';

class EditProfile extends ConsumerStatefulWidget {
  User user;
  EditProfile(this.user, {super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final nameFirst = TextEditingController();
  final nameLast = TextEditingController();
  late User users;

  @override
  void initState() {
    users = widget.user;
    nameFirst.text = users.first_name;
    nameLast.text = users.last_name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameFirst,
              decoration: InputDecoration(
                  labelText: "Name First",
                  hintText: nameFirst.text,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              controller: nameLast,
              decoration: InputDecoration(
                  labelText: "Name Last",
                  hintText: nameLast.text,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () async {
                  User usersUpdate = users.copyWith(
                      first_name: nameFirst.text, last_name: nameLast.text);

                  ref.read(apiProvider).update(usersUpdate).then(
                    (value) {
                      if (value == true) {
                        ref.refresh(apiProvider).getUser().whenComplete(
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  )),
                            );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }
                    },
                  );
                },
                child: Text('Update Profile'))
          ],
        ),
      ),
    );
  }
}
