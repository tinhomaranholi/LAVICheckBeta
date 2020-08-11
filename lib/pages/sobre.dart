import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sobre o Lavi"),
          backgroundColor: Color(0xFFe64a19),
          centerTitle: true
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
                "Algum texto sobre o LAVI",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),

    );
  }
}
