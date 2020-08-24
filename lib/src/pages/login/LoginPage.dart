import 'package:flutter/material.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, this.jumpToPage}) : super(key: key);

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
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: AppColors.black,
                        onPressed: () {
                          jumpToPage(0);
                        },
                      ),
                    ),
                    loginText(height, width),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: AppColors.black),
                            suffixIcon: Icon(Icons.alternate_email),
                            suffixStyle: TextStyle(color: AppColors.black),
                            fillColor: AppColors.green,
                            filled: true,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: AppColors.black),
                            suffixIcon: Icon(Icons.vpn_key),
                            suffixStyle: TextStyle(color: AppColors.black),
                            fillColor: AppColors.green,
                            filled: true,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          color: AppColors.midGreen,
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                      SizedBox(height: 32.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('¿No estas registrado? ',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.black)),
                          GestureDetector(
                            onTap: () {
                              jumpToPage(2);
                            },
                            child: Text('Regístrate aquí.',
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.blue)),
                          )
                        ],
                      ),
                      SizedBox(height: 16.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('¿Olvidaste tu contraseña? ',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.black)),
                          GestureDetector(
                            onTap: () {
                              jumpToPage(5);
                            },
                            child: Text('Ingresa aquí.',
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.blue)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginText(height, width) {
    return Positioned(
      left: width * 0.2,
      bottom: height * 0.20,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Ingresa ',
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
}
