import 'package:flutter/material.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({Key key, this.jumpToPage}) : super(key: key);

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
                    registerUserText(height, width)
                  ],
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        registerInput('Nombre'),
                        registerInput('Apellido'),
                        registerInput('Email'),
                        registerInput('Contraseña', obscure: true),
                        registerInput('Repetir contraseña', obscure: true),
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
                              jumpToPage(3);
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

  registerUserText(height, width) {
    return Positioned(
      left: width * 0.1,
      bottom: height * 0.1,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Registra ',
              style: TextStyle(fontSize: 26, color: AppColors.black)),
          TextSpan(
              text: 'tus \n',
              style: TextStyle(fontSize: 26, color: AppColors.midGreen)),
          TextSpan(
              text: 'datos',
              style: TextStyle(fontSize: 26, color: AppColors.black)),
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
