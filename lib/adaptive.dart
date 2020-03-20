
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Widget Behaviour(BuildContext context, Widget widget);

class Adaptive {

  // removes overscroll 'waves' effect on iOS devices and resets the scale factor
  static Behaviour getBehaviour(BuildContext context) {
    if(Theme.of(context).platform == TargetPlatform.iOS) {
      return (context, child) => ScrollConfiguration(behavior: NoScrollOverflow(), child: MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child));
    } else {
      return (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child);
    }
  }
}

class NoScrollOverflow extends ScrollBehavior {

  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}