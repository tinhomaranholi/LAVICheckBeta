import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavi_check/pages/sobre.dart';
import 'package:lavi_check/pages/item1.dart';
import 'Dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final itens = <Map>[
  {
    "nome":
        "Refrerenciar botões e caixa de testo, links ou elementos de entrada/controle.",
    "check": false
  },
  {
    "nome":
        "Arquivo(s) de áudio e/ou vídeo possui(em) descrição do que se trata(m) e do conteúdo da(s) mídia(s).",
    "check": false
  },
  {
    "nome":
        "Indicar, através de elementos semânticos, alternativa escrita da mídia existente.",
    "check": false
  },
  {
    "nome":
        "Elemento(s) na tela que não pode(em) ter seu(s) conteúdo(s) em formato de texto, como testes e exercícios, possue(em) descrição da finalidade do conteúdo.",
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
  {
    "nome":
        "As informações existentes na tela do aplicativo estão organizadas, no código, de modo  os leitores de tela expressem as informações sem causar confusão ao usuáririo.",
    "check": false
  },
  {
    "nome":
        "Informações implícitas (negritos, itálico, coloração diferenciada, hiperlink) devem ser sinalizadas em froma de texto.",
    "check": false
  }
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
                  "Victor Maranholi",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),//Menu de navegação
              accountEmail: Text(
                  "victor_maranholi@ufmt.br",
                  style: TextStyle(fontSize: 20 * scaleFactor),
              ),//Menu de navegação
              currentAccountPicture: CircleAvatar(//imagem do avatar do aplicativo (foto pessoa)
                backgroundImage: AssetImage("assets/images/eu.jpg"),
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
            ListTile(
              leading: Icon(Icons.history),
              title: Text(
                "Item 1 ",
                style: TextStyle(fontSize: 20 * scaleFactor),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Item1()));
                tooltip: "Item1";
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
                    title: Text(itens[index]["nome"],
                        style: TextStyle(fontSize: 20 * scaleFactor) // escalonagem do tamanho da fonte de acordo com as configurações do usuário
                    ),
                    subtitle: Text(
                      "Este item ${itens[index]["check"] ? "" : " não"} está implementado",
                    ),
                    value: itens[index]["check"],
                    secondary: CircleAvatar(
                      child: Icon(
                          itens[index]["check"] ? Icons.check : Icons.error),//ícone lateral esquerdo dos checklist
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
