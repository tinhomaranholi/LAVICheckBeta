import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          "Em caso de elementos de segurança do tipo CAPTCHA, a tela oferece recursos de acessibilidade para o usuário contornar o elemento.",
      "check": false
    },
    {
      "nome":
      "Em caso de existência de elemento(s) que não possui(am) sentido ao usuário, este(s) é(são) ignorado(s) pela tecnologia assistiva. ",
      "check": false
    },
    {
      "nome":
      "Para todo o conteúdo de mídia visual pré-ravada, há uma descrição detalhada, em forma de texto ou áudio, que transmite todos os detalhes da mídia - como ações, movimentos, e expressões dos agentes apresentados no conteúdo visual - de modo que o deficiente visual tenha acesso às informações necessárias para entender a mídia.  ",
      "check": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CheckList LAVI",
        ),
        backgroundColor: Color(0xFFe64a19),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
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
                        child: Icon(itens[index]["check"] ? Icons.check : Icons.error),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          itens[index]["check"] = newValue;
                        });
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
