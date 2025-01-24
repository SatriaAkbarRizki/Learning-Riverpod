import 'package:flutter/material.dart';
import 'package:learning_futureprovider/model/user.dart';

class Profile extends StatelessWidget {
  User user;
  Profile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child:
                    CircleAvatar(backgroundImage: NetworkImage(user.avatar))),
            Text(
              user.first_name,
              style: TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
