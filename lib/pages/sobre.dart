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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "O LAVI atua na análise e desenvolvimento de sistemas, contribuindo com a sociabilização de tecnologias digitais e com o processo de ensino-aprendizagem. "
                    "\n\nAs áreas de pesquisa, citadas brevemente a seguir, envolvem estudos em domínios de aplicação tais quais educação, sistemas comerciais, entretenimento e governo eletrônico. "
                    "- Interação Humano-Computador: estuda a facilidade de uso dos sistemas. As atividades envolvem diretrizes de projeto de interfaces, avaliação/inspeção "
                    "da interação, acessibilidade, privacidade, legado digital pós-morte, uso de métricas erealidade virtual. - Agentes Inteligentes: visa, em especial, "
                    "apoiar atividades desenvolvidas em ambientes colaborativos.\n\n Pesquisa ainda questões relacionadas a ontologias. - Web Social: o estudo das redes "
                    "sociais e comunidades virtuais, explorando os elementos da Web Social. - Qualidade de Software: pesquisa ferramentas e técnicas para melhorar a "
                    "qualidade de sistemas, relacionadas ao produto ou ao processo de desenvolvimento.",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
