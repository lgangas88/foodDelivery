import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key, this.jumpToPage}) : super(key: key);

  final Function(int indexPage) jumpToPage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    welcomeText(height, width),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: SvgPicture.asset(
                        'assets/images/nombre-empresa.svg',
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    googleAuthButton(),
                    facebookAuthButton(),
                    emailAuthButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  googleAuthButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: AppColors.red),
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.googlePlus,
              color: AppColors.red,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Google',
              style: TextStyle(color: AppColors.red),
            )
          ],
        ),
      ),
    );
  }

  facebookAuthButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: AppColors.blue),
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.facebookF,
              color: AppColors.blue,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Facebook',
              style: TextStyle(color: AppColors.blue),
            )
          ],
        ),
      ),
    );
  }

  emailAuthButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: AppColors.black),
        onPressed: () {
          jumpToPage(1);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.mail,
              color: AppColors.black,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Tu correo',
              style: TextStyle(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }

  welcomeText(height, width) {
    return Positioned(
      right: 0,
      bottom: height * 0.20,
      child: RichText(
        text: TextSpan(
            text: '¡Hola! \n',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: AppColors.black),
            children: [
              TextSpan(
                  text: 'Inicia \n',
                  style: TextStyle(fontSize: 26, color: AppColors.black)),
              TextSpan(
                  text: 'sesión',
                  style: TextStyle(fontSize: 26, color: AppColors.midGreen)),
              TextSpan(
                  text: ' con',
                  style: TextStyle(fontSize: 26, color: AppColors.black)),
            ]),
      ),
    );
  }
}
