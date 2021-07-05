import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Register/Register_Confirm_W.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/inputLoginRegisterFormField.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final ScreenController _screenController = Get.find();
final ClientController _clientController = Get.find();

TextEditingController _controllerCep = TextEditingController();
TextEditingController _controllerNumber = TextEditingController();

TextEditingController _controllerAddress = TextEditingController();
TextEditingController _controllerDistrict = TextEditingController();
TextEditingController _controllerCity = TextEditingController();

TextEditingController _controllerName =
    TextEditingController();
TextEditingController _controllerEmail =
    TextEditingController();
TextEditingController _controllerPhone =
    TextEditingController();
TextEditingController _controllerPassword =
    TextEditingController();

final GlobalKey<FormState> _globalKeyFormRegister1Widget =
    new GlobalKey<FormState>();
final GlobalKey<FormState> _globalKeyFormRegister2Widget =
    new GlobalKey<FormState>();
final GlobalKey<FormState> _globalKeyFormRegister3Widget =
    new GlobalKey<FormState>();

var _maskFormatterPhone = new MaskTextInputFormatter(
    mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

var _maskFormatterCep = new MaskTextInputFormatter(
    mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

Widget formRegister1Widget() => Form(
      key: _globalKeyFormRegister1Widget,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          inputFormFieldWidget(
            "Digite o seu número de telefone",
            "Telefone",
            _controllerPhone,
            Icon(Icons.phone),
            [_maskFormatterPhone],
            textInputType: TextInputType.number,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (!GetUtils.isPhoneNumber(_text)) {
                return 'Número de telefone inválido!';
              } else if (_text.length < 14) {
                return 'Número de telefone inválido!';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite seu cep",
            "Cep",
            _controllerCep,
            Icon(Icons.house),
            [_maskFormatterCep],
            textInputType: TextInputType.number,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 9) {
                return 'Seu cep não pode ser tão curto';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite o número da sua residência",
            "Número da residência",
            _controllerNumber,
            Icon(Icons.house),
            [],
            textInputType: TextInputType.number,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          GetBuilder<ScreenController>(
            builder: (_) => ElevatedButton(
              onPressed: () async {
                if (_globalKeyFormRegister1Widget.currentState!.validate()) {
                  if (!_screenController.loadingRegister) {
                    if (_controllerCep.text != "" &&
                        _controllerNumber.text != "" &&
                        _controllerPhone.text != "") {
                      _screenController.setLoadingRegister(true);
                      Map<String, dynamic> _data = await _clientController
                          .getAddressFromCep(_controllerCep.text);
                      if (_data['next']) {
                        Map<String, dynamic> _addressFromCep = _data['res'];
                        _controllerAddress.text = _addressFromCep['logradouro'];
                        _controllerDistrict.text = _addressFromCep['bairro'];
                        _controllerCity.text = _addressFromCep['localidade'];
                        _screenController
                            .setTabControllerLoginRegister(2);
                        _screenController.setLoadingRegister(false);
                      } else {
                        _screenController.setLoadingRegister(false);
                      }
                    } else {
                      snackBarError(
                          "Atenção!", "Nenhum campo pode ficar vazio");
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(primary: Get.theme.primaryColor),
              child: Padding(
                child: _screenController.loadingRegister
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Prosseguir",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );

Widget formRegister2Widget() => Form(
      key: _globalKeyFormRegister2Widget,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          inputFormFieldWidget(
            "Digite o seu endereço",
            "Endereço",
            _controllerAddress,
            Icon(Icons.house),
            [],
            readOnly: true,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 9) {
                return 'Seu endereço não pode ser tão curto';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite o nome do seu bairro",
            "Bairro",
            _controllerDistrict,
            Icon(Icons.house),
            [],
            readOnly: true,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 3) {
                return 'O nome do seu bairro não pode ser tão curto';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite o nome da sua cidade",
            "Cidade",
            _controllerCity,
            Icon(Icons.house),
            [],
            readOnly: true,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 3) {
                return 'O nome da sua cidade não pode ser tão curto';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          GetBuilder<ScreenController>(
            builder: (_) => ElevatedButton(
              onPressed: () {
                if (_controllerAddress.text != "" &&
                    _controllerDistrict.text != "" &&
                    _controllerCity.text != "" &&
                    _controllerCep.text != "" &&
                    _controllerNumber.text != "" &&
                    _controllerPhone.text != "") {
                  _screenController.setTabControllerLoginRegister(3);
                } else {
                  snackBarError("Atenção!", "Nenhum campo pode ficar vazio");
                }
              },
              style: ElevatedButton.styleFrom(primary: Get.theme.primaryColor),
              child: Padding(
                child: _screenController.loadingRegister
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Prosseguir",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GetBuilder<ScreenController>(
            builder: (_) => ElevatedButton(
              onPressed: () {
                if (!_screenController.loadingRegister) {
                  _screenController.setTabControllerLoginRegister(1);
                }
              },
              style: ElevatedButton.styleFrom(primary: Get.theme.accentColor),
              child: Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      "Voltar",
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );

Widget formRegister3Widget() => Form(
      key: _globalKeyFormRegister3Widget,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          inputFormFieldWidget(
            "Digite o seu nome",
            "Nome",
            _controllerName,
            Icon(Icons.person),
            [],
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 4) {
                return 'Seu nome não pode ser tão curto';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite o seu email",
            "Email",
            _controllerEmail,
            Icon(Icons.email),
            [],
            textCapitalization: TextCapitalization.none,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (!GetUtils.isEmail(_text)) {
                return 'Email inválido';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          inputFormFieldWidget(
            "Digite a sua senha",
            "********",
            _controllerPassword,
            Icon(Icons.lock),
            [],
            obscure: true,
            onValidator: (String _text) {
              if (_text.isEmpty) {
                return 'Preencha esse campo!';
              } else if (_text.length < 8) {
                return 'Sua senha não pode ser tão curta';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          GetBuilder<ScreenController>(
            builder: (_) => ElevatedButton(
              onPressed: () {
                if (_globalKeyFormRegister3Widget.currentState!.validate()) {
                  if (!_screenController.loadingRegister) {
                    if (_controllerAddress.text != "" &&
                        _controllerDistrict.text != "" &&
                        _controllerCity.text != "" &&
                        _controllerCep.text != "" &&
                        _controllerNumber.text != "" &&
                        _controllerName.text != "" &&
                        _controllerEmail.text != "" &&
                        _controllerPassword.text != "" &&
                        _controllerPhone.text != "") {
                      Get.bottomSheet(
                        registerConfirm({
                          "name": _controllerName.text,
                          "email": _controllerEmail.text,
                          "phone": _controllerPhone.text,
                          "cep": _controllerCep.text,
                          "city": _controllerCity.text,
                          "district": _controllerDistrict.text,
                          "address": _controllerAddress.text,
                          "number": _controllerNumber.text,
                          "password": _controllerPassword.text,
                        }),
                      );
                    }
                  }
                }
              },
              //},
              style: ElevatedButton.styleFrom(primary: Get.theme.primaryColor),
              child: Padding(
                child: _screenController.loadingRegister
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Prosseguir",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GetBuilder<ScreenController>(
            builder: (_) => ElevatedButton(
              onPressed: _screenController.loadingRegister
                  ? null
                  : () =>
                  _screenController.setTabControllerLoginRegister(2),
              style: ElevatedButton.styleFrom(primary: Get.theme.accentColor),
              child: Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      "Voltar",
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
