import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBarError(String _title, String _message) => Get.snackbar(
      _title,
      _message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 10),
      shouldIconPulse: true,
      icon: Icon(Icons.error),
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 1),
    );
