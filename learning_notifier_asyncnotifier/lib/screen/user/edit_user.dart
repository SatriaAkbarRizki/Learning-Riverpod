import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_notifier_asyncnotifier/model/user.dart';
import 'package:learning_notifier_asyncnotifier/provider/network/user_notifier.dart';
import 'package:learning_notifier_asyncnotifier/screen/user/home_user.dart';

class EditProfile extends ConsumerStatefulWidget {
  final User user;
  const EditProfile(this.user, {super.key});

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
                  User user = users.copyWith(
                      first_name: nameFirst.text, last_name: nameLast.text);

                  ref.read(userNetworkProvider.notifier).updateUser(user);
                  final status = ref.read(userNetworkProvider).isReloading;
                  if (status) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeUser(),
                        ));
                  }
                },
                child: Text('Update Profile'))
          ],
        ),
      ),
    );
  }
}
