import 'package:flutter/material.dart';

class Popups {

  static const double DEFAULT_HEIGHT = 270;

  static void generic({
    @required BuildContext context,
    @required Widget content,
    double height = DEFAULT_HEIGHT
  }) {
    showGeneralDialog(
      context: context,
      transitionDuration: Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) {
        final double curvedValue = Curves.easeInOutQuad.transform(1 - a1.value);
        final double width = MediaQuery.of(context).size.width - 30;
        return Align(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
            offset: Offset(0, -15 + curvedValue * (height - 30)),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Material(
                type: MaterialType.transparency,
                child: content
              )
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) { return null; }
    );
  }
}