import 'package:flutter/material.dart';
import 'package:lavi_check/pages/home_page.dart';

class Item1 extends StatelessWidget {
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
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(7.0),
                itemCount: itens.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(itens[index]["nome"],
                    ),
                    subtitle: Text(
                      "Este item ${itens[index]["check"] ? "" : " não"} está implementado",
                    ),
                  );
                }
            ),
          )
        ],
      )
    );
  }
}
