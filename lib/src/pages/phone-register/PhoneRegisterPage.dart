import 'package:flutter/material.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class PhoneRegisterPage extends StatelessWidget {
  const PhoneRegisterPage({Key key, this.jumpToPage}) : super(key: key);

  final Function(int indexPage) jumpToPage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            jumpToPage(1);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.black,
                          )),
                    ),
                    registerPhoneText(height, width)
                  ],
                ),
              ),
              Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        registerInput('Número celular'),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            color: AppColors.midGreen,
                            child: Text(
                              'Aceptar',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              jumpToPage(4);
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  registerPhoneText(height, width) {
    return Positioned(
      left: 16.0,
      bottom: 16.0,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Registra tu ',
              style: TextStyle(fontSize: 16, color: AppColors.black)),
          TextSpan(
              text: 'número celular \n',
              style: TextStyle(fontSize: 16, color: AppColors.midGreen)),
          TextSpan(
              text: 'y te enviaremos un mensaje \n',
              style: TextStyle(fontSize: 16, color: AppColors.black)),
          TextSpan(
              text: 'sms ',
              style: TextStyle(fontSize: 16, color: AppColors.midGreen)),
          TextSpan(
              text: 'para la validación',
              style: TextStyle(fontSize: 16, color: AppColors.black)),
        ]),
      ),
    );
  }

  registerInput(placeholder, {obscure = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: '$placeholder',
          labelStyle: TextStyle(color: AppColors.black),
          fillColor: AppColors.green,
          filled: true,
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
      ),
    );
  }
}