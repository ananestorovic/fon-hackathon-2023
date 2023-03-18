import 'package:qr_scanner/models/userModel.dart';
import 'package:qr_scanner/pages/authenticate/login.dart';
import 'package:qr_scanner/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);

    if (user == null) {
      return Login();
    } else {
      return Homepage(
        uid: user.uid,
      );
    }
  }
}
