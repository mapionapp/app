import 'package:flutter/material.dart';
import 'package:w27/w27_colors.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Text('Bevor Du loslegst...', style: TextStyle(fontSize: 30)),
                SizedBox(height: 10),
                Text('Dies ist eine App, die jeder und jedem in unserer Gesellschaft den Zugang zu notwendigen Gütern in dieser schwierigen Zeit erleichtern soll. Diese App ist kein Ort, um Hamsterkäufe zu planen. ', style: TextStyle(fontSize: 20)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(text: 'Der Einzelhandel bleibt geöffnet und die Lieferketten bestmöglich aufrechterhalten. ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '(Meldung der Bundesregierung)')
                    ]
                  )
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(text: 'Das funktioniert nur, wenn '),
                      TextSpan(text: 'jede und jeder mithilft', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ', indem er/sie angemessenem Maße einkauft. Bitte denke beim Einkaufen auch Menschen, denen es derzeit nur erschwert möglich ist, ihre Einkäufe tätigen. ')
                    ]
                  )
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 10),
          FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            color: W27Colors.primaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text('OK', style: TextStyle(fontSize: 20, color: Colors.white))
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
