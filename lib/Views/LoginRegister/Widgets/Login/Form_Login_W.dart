import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/inputLoginRegisterFormField.dart';

TextEditingController _controllerEmail = new TextEditingController();
TextEditingController _controllerPassword = new TextEditingController();
final GlobalKey<FormState> _globalKeyFormLoginWidget = new GlobalKey<FormState>();

final ScreenController _screenController = Get.find();
final ClientController _clientController = Get.find();

Widget formLoginWidget() => Form(
  key: _globalKeyFormLoginWidget,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      inputFormFieldWidget("Digite seu email", "Email", _controllerEmail, Icon(Icons.person), [],
        textCapitalization: TextCapitalization.none,
        onValidator: (String _text){
          if (_text.isEmpty) {
            return 'Preencha esse campo!';
          } else if (!GetUtils.isEmail(_text)) {
            return 'Preencha um email válido';
          }
        }
      ),
      SizedBox(
        height: 4,
      ),
      inputFormFieldWidget("**********", "Senha", _controllerPassword, Icon(Icons.lock), [],
          onValidator: (String _text){
            if (_text.isEmpty) {
              return 'Preencha esse campo!';
            } else if (_text.length < 8){
              return 'Sua senha não pode ser tão curta';
            }
            return null;
      }, obscure: true,),
      SizedBox(
        height: 16,
      ),
      GestureDetector(
        child: Text(
          "Esqueceu sua senha?",
          textAlign: TextAlign.end,
          style: GoogleFonts.roboto(fontSize: 15),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 32,
      ),
      GetBuilder<ScreenController>(builder: (_) => ElevatedButton(
        onPressed: (){
          if (_globalKeyFormLoginWidget.currentState!.validate()){
              if (!_screenController.loadingLogin){
                _clientController.login(_controllerEmail.text, _controllerPassword.text);
              }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Get.theme.primaryColor,
        ),
        child: Padding(
          child: _screenController.loadingLogin ? CircularProgressIndicator(color: Colors.white,) : Text(
            "Login",
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
        ),),),
    ],
  ),);