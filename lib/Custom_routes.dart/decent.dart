import 'package:flutter/material.dart';

class Decent extends PageRouteBuilder {
  final Widget widget;
  Alignment alignment;
  Decent({this.widget, this.alignment})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);

              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: alignment,
              );
            });
}
