import 'package:flutter/material.dart';
import 'package:loja_do_real/Views/ProfilePage/Widgets/CardProfileWidget.dart';
import 'package:loja_do_real/Views/ProfilePage/Widgets/InfoUserProfileWidget.dart';

class ProfilePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            cardProfileWidget(),
            infoUserProfileWidget(),
          ],
        ),
      ),
    );
  }
}
