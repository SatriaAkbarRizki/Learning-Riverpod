import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_notifier_asyncnotifier/provider/network/user_notifier.dart';
import 'package:learning_notifier_asyncnotifier/screen/user/edit_user.dart';

class HomeUser extends ConsumerWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dataUser = ref.watch(userNetworkProvider);
    return Scaffold(
      body: switch (dataUser) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(value[index].avatar),
              ),
              title: Text(value[index].first_name),
              subtitle: Text(value[index].last_name),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(value[index]),
                        ));
                  },
                  icon: Icon(Icons.edit)),
            ),
          ),
        AsyncError(:final error) => Center(
            child: Text(error.toString()),
          ),
        _ => Center(
            child: CircularProgressIndicator(),
          )
      },
    );
  }
}
