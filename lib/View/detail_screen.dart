import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod_fetching_api/Models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.item}) : super(key: key);
  final UserModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(item.avatar),
            ),
            const SizedBox(height: 30),
            Text(
              item.firstName + item.lastName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(item.email,
                style: const TextStyle(
                  fontSize: 20,
                )),
          ],
        ),
      ),
    );
  }
}
