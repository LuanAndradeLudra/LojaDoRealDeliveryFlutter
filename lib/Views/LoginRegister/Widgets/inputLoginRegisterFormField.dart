import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

onValidatorFunction (String text) {
  if (text.isEmpty) {
    return 'Preencha esse campo!';
  }
}

Widget inputFormFieldWidget(String _hint, String _label, TextEditingController _controller, Widget _icon, List<TextInputFormatter> _inputFormatter,
    {bool readOnly = false, bool obscure = false, TextInputType textInputType = TextInputType.text, Function onValidator = onValidatorFunction, TextCapitalization textCapitalization = TextCapitalization.sentences}
    ) => TextFormField(
  inputFormatters: _inputFormatter,
  textCapitalization: textCapitalization,
  keyboardType: textInputType,
  cursorColor: Get.theme.primaryColor,
  obscureText: obscure,
  controller: _controller,
  readOnly: readOnly,
  decoration: InputDecoration(
    prefixIcon: _icon,
    hintText: _hint,
    hintStyle: TextStyle(color: Colors.black54),
    labelText: _label,
    labelStyle: TextStyle(color: Colors.black54),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.4), width: 1.0),
    ),
  ),
  validator: (value) {
    return onValidator(value);
  },
);