import 'package:flutter/material.dart';

class Bounce extends PageRouteBuilder {
  final Widget widget;
  Alignment alignment;
  Bounce({this.widget, this.alignment})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticOut);

              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: alignment,
              );
            });
}
