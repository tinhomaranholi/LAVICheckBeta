import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavi_check/pages/sobre.dart';
import 'Dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final itens = <Map>[
  {
    "nome":
        "Os botões/caixa(s) de texto/imagens de links, ou qualquer outro elemento de entrada/controle de dados, está(ão) devidamente referenciado(s).",
    "check": false
  },
  {
    "nome":
        "Se há arquivo(s) de áudio e/ou vídeo na tela, este(s) possue(em) alternativa(s) em texto com descrição completa do conteúdo da(s) mídia(s).",
    "check": false
  },
  {
    "nome":
        "Se há arquivo(s) de áudio e/ou vídeo na tela, este(s) possue(em) alternativa(s) em texto com descrição completa do conteúdo da(s) mídia(s).",
    "check": false
  },
  {
    "nome":
        "Há elemento(s) na tela que não pode(em) ter seu(s) conteúdo(s) em formato de texto, como testes e exercícios, mas possue(em) descrição da finalidade do conteúdo.",
    "check": false
  },
  {
    "nome":
        "Caso hája elemento(s) sensorial(ais) presente(s) na tela, este(s) possui descrição(ões) de sua(s) finalidade(s).",
    "check": false
  },
  {
    "nome":
        "Elementos de segurança do tipo CAPTCHA oferece(m) recurso(s) de acessibilidade para o usuário contornar o elemento.",
    "check": false
  },
  {
    "nome":
        "Elemento(s) que não possui(am) sentido ao usuário é(são) ignorado(s) pela tecnologia assistiva. ",
    "check": false
  },
  {
    "nome":
        "Todo o conteúdo de mídia visual pré-ravada possui uma descrição detalhada, em forma de texto ou áudio, que transmite todos os detalhes da mídia - como ações, movimentos, e expressões dos agentes apresentados no conteúdo visual - de modo que o deficiente visual tenha acesso às informações necessárias para entender a mídia.  ",
    "check": false
  },
];

class _HomePageState extends State<HomePage> {

  Future<Null> _refresh() async{ //organização da lista
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      itens.sort((a, b){
        if(a["check"] && !b["check"]) return 1;
        else if(!a["check"] && b["check"]) return -1;
        else return 0;
      });
    });
    return null;
  }//fim organização da lista

  @override
  Widget build(BuildContext context) {
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
              accountName: Text("Victor Maranholi"),//Menu de navegação
              accountEmail: Text("victor_maranholi@ufmt.br"),//Menu de navegação
              currentAccountPicture: CircleAvatar(//imagem do avatar do aplicativo (foto pessoa)
                backgroundImage: AssetImage(" "),
              ), //Menu de navegação
              decoration: BoxDecoration(color: Colors.deepOrange),//Menu de navegação
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Início"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                tooltip: "Início do aplicativo";
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Sobre o LAVI"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Sobre()));
                tooltip: "Sobre o LAVI";
              },
            ),
            ListTile( //botão de sair  no menu de nagecação
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),

              onTap: (){
                SystemNavigator.pop();
                semanticLabel: 'Sair do Aplicativo';
              },
            )
          ],
        ),
      ),//Fim Menu de navegação


      body: Column(//Início escopo do aplicativo
        children: <Widget>[
          Expanded(
              child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(//Início das listas
                padding: EdgeInsets.all(7.0),
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(itens[index]["nome"]),
                    subtitle: Text(
                      "Este item ${itens[index]["check"] ? "" : " não"} está implementado",
                    ),
                    value: itens[index]["check"],
                    secondary: CircleAvatar(
                      child: Icon(
                          itens[index]["check"] ? Icons.check : Icons.error),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        itens[index]["check"] = newValue;
                      });
                    },
                  );
                }),//Fim das listas
          ))
        ],
      ),
    );
  }
}
