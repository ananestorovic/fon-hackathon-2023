import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/userModel.dart';
import 'package:flutter_application_1/user_profile.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);

    if (user == null) {
      return Login();
    } else {
      return UserProfile(uid: user.uid);
    }
  }
}
