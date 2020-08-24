import 'package:flutter/material.dart';
import 'package:tarsk_app/src/pages/auth/AuthPage.dart';
import 'package:tarsk_app/src/pages/login/LoginPage.dart';
import 'package:tarsk_app/src/pages/new-password/NewPasswordPage.dart';
import 'package:tarsk_app/src/pages/new-password/ValidateNewPasswordPage.dart';
import 'package:tarsk_app/src/pages/phone-register/PhoneRegisterPage.dart';
import 'package:tarsk_app/src/pages/phone-register/ValidatePhonePage.dart';
import 'package:tarsk_app/src/pages/user-register/RegisterUserPage.dart';
import 'package:tarsk_app/src/utils/colors.dart';
import 'package:tarsk_app/src/utils/enum.dart';


class AuthBackground extends StatefulWidget {
  AuthBackground({Key key}) : super(key: key);

  @override
  _AuthBackgroundState createState() => _AuthBackgroundState();
}

class _AuthBackgroundState extends State<AuthBackground> {
  final pageViewController = PageController(initialPage: 0);

  var circleBackgroundState = CircleBackgroundState.first;

  setCircleBackgroundState(CircleBackgroundState state) {
    setState(() {
      circleBackgroundState = state;
    });
  }

  jumpToPage(int indexPage) {
    switch (indexPage) {
      case 0:
        setCircleBackgroundState(CircleBackgroundState.first);
        break;
      case 1:
        setCircleBackgroundState(CircleBackgroundState.second);
        break;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        setCircleBackgroundState(CircleBackgroundState.third);
        break;
      default:
    }
    pageViewController.jumpToPage(indexPage);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          bigYellowCircle(height, width),
          smallYellowCircle(height, width),
          greenCircle(height, width),
          pages(),
        ],
      ),
    );
  }

  pages() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageViewController,
      children: <Widget>[
        AuthPage(jumpToPage: jumpToPage), // index page 0
        LoginPage(jumpToPage: jumpToPage), // index page 1
        RegisterUserPage(jumpToPage: jumpToPage), // index page 2
        PhoneRegisterPage(jumpToPage: jumpToPage), // index page 3
        ValidatePhonePage(jumpToPage: jumpToPage), // index page 4
        NewPasswordPage(jumpToPage: jumpToPage), // index page 5
        ValidateNewPasswordPage(jumpToPage: jumpToPage), // index page 6
      ],
    );
  }

  bigYellowCircle(height, width) {
    double top;
    double right;

    switch (circleBackgroundState) {
      case CircleBackgroundState.first:
        top = -(width * 0.4);
        right = -(width * 0.45);
        break;
      case CircleBackgroundState.second:
        top = -(width * 0.4);
        right = -(width * 0.09);
        break;
      case CircleBackgroundState.third:
        top = -(width * 0.4);
        right = (width * 0.3);
        break;

      default:
    }

    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      top: top,
      right: right,
      child: Container(
        height: width * 1.2,
        width: width * 1.2,
        decoration: BoxDecoration(
          color: AppColors.highYellow,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  smallYellowCircle(height, width) {

    double bottom;
    double right;

    switch (circleBackgroundState) {
      case CircleBackgroundState.first:
        bottom = height * 0.1;
        right = -10;
        break;
      case CircleBackgroundState.second:
        bottom = height * 0.1;
        right = width - 25;
        break;
      case CircleBackgroundState.third:
        bottom = height * 0.1;
        right = width;
        break;

      default:
    }

    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      bottom: bottom,
      right: right,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  greenCircle(height, width) {

    double bottom;
    double left;

    switch (circleBackgroundState) {
      case CircleBackgroundState.first:
        bottom = -(width * 0.3);
        left = -(width * 0.2);
        break;
      case CircleBackgroundState.second:
        bottom = -(width * 0.3);
        left = -(width * 0.6);
        break;
      case CircleBackgroundState.third:
        bottom = -(width * 0.45);
        left = (width * 0.3);
        break;

      default:
    }

    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      bottom: bottom,
      left: left,
      child: Container(
        height: width * 0.6,
        width: width * 0.6,
        decoration: BoxDecoration(
          color: AppColors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
  
}
