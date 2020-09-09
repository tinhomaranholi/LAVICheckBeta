import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavi_check/pages/sobre.dart';
import 'package:lavi_check/pages/listadeitens.dart';
import 'Dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<Null> _refresh() async{ //organização da lista
    await Future.delayed(Duration(seconds: 1));
    return null;
  }//fim organização da lista

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold( //construtor do leyalt do app
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CheckList LAVI",
        ),
        backgroundColor: Color(0xFFe64a19),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader( //Menu de navegação
              accountName: Text(
                  "LAVI IC/UFMT",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),//Menu de navegação
              accountEmail: Text(
                  "www.ic.ufmt.br",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),//Menu de navegação
              currentAccountPicture: CircleAvatar(//imagem do avatar do aplicativo (foto pessoa)
                backgroundImage: AssetImage("assets/images/lavi_logo.png"),
              ), //Menu de navegação
              decoration: BoxDecoration(color: Color(0xFFe64a19)),//Menu de navegação
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                  "Início",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                tooltip: "Início do aplicativo";
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text(
                  "Sobre o LAVI",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Sobre()));
                tooltip: "Sobre o LAVI";
              },
            ),
            ListTile( //botão de sair  no menu de nagecação
              leading: Icon(Icons.exit_to_app),
              title: Text(
                  "Sair",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),

              onTap: (){
                SystemNavigator.pop();
                semanticLabel: 'Sair do Aplicativo';
              },
            ),
          ],
        ),
      ),//Fim Menu de navegação


      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(7.0),
              itemCount: ListaDeItens.length,
              itemBuilder: (BuildContext context, index){
                return ItensdaLista(
                  ListaDeItens[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
