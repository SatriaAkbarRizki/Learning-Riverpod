import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_futureprovider/provider/data_provider.dart';
import 'package:learning_futureprovider/screen/edit_profile.dart';
import 'package:learning_futureprovider/screen/profile.dart';
import 'package:learning_futureprovider/service/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, WidgetRef ref, child) {
        final _data = ref.watch(userDataProvider);
        return Center(
          child: _data.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(data[index]),
                    )),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar),
                  ),
                  title: Text(data[index].first_name),
                  subtitle: Text(data[index].last_name),
                  trailing: IconButton(
                      onPressed: () {
                        ref.invalidate(apiProvider);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(data[index]),
                            ));
                      },
                      icon: Icon(Icons.edit)),
                ),
              ),
            ),
            error: (error, stackTrace) => Text("Error: ${error.toString()}"),
            loading: () => CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
