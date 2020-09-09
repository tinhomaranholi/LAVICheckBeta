import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:lavi_check/pages/home_page.dart';

class ItensdaLista extends StatelessWidget {
  final MinhaLista minhaLista;

  ItensdaLista(this.minhaLista);

  @override
  Widget build(BuildContext context) {
    return _contrutorLista(minhaLista);
  }

  Widget _contrutorLista(MinhaLista i) {
    if (i.children.isEmpty)
      return Container(
          color: Colors.black87,
          child: ListTile(
              dense: true,
              enabled: true,
              subtitle: Text(""),
              selected: true,
              /*onTap: () async {
            const url =
                'https://flutter.dev/docs/development/accessibility-and-localization/accessibility';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            } else {
              throw 'não deu';
            }
          },*/
              title: Text(
                i.title,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
          ),
      );

    return ExpansionTile(
      key: PageStorageKey<int>(3),
      title: Text(
        i.title,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.justify,
      ),
      trailing: Icon(Icons.more_vert),
      children: i.children.map(_contrutorLista).toList(),
    );
  }
}

class MinhaLista {
  String title;
  List<MinhaLista> children;

  MinhaLista(this.title, [this.children = const <MinhaLista>[]]);
}

List<MinhaLista> ListaDeItens = <MinhaLista>[
  MinhaLista(
    'Referencie o(s) botão(ões), caixa(s) de texto, link(s) ou elementos de entrada/controle',
    <MinhaLista>[
      MinhaLista(
          'Utilize elementos semânticos para sinalizar botões, caixas de texto, etc. Pode-se utilizar o recurso "semanticLabel" - que é equivalente ao alt de html'
          ' ou "tooltip:" para informar ao leitor de tela a função de um botão. Observe o exemplo:'),
      MinhaLista(
          '[...]\nbody: Container(\n  child: Column(\n    children: <Widget>[\n      Expanded(\n         child: Image.network(\n          "http://enderecodeimagem.com", semanticLabel: "Foto de uma cidade"[...]\n        ),\n      ),\n    ],\n  ),\n)'),
    ],
  ),
  MinhaLista(
    'Todo(s) o(s) arquivo(s) de áudio e/ou vídeo devem possui(em) descrição do(s) conteúdo(s) apresentado na mídia.',
    <MinhaLista>[
      MinhaLista(
          'Descreva, em formato de texto, o conteúdo midiático exibido em seu aplicativo.'
          ' Por exemplo: um vídeo que exibe uma notícia terá uma descrição informando que aquele vídeo está exibindo uma notícia. '
          ' Isso auxiliará na navegação do aplicativo sem causar confusão de navegação no usuário ao utilizar a tecnologia assistiva.'),
    ],
  ),
  MinhaLista(
    'Utilize elemento(s) semântico(s) para indicar alternativa(s) à(s) mídia(s) existente(s)',
    <MinhaLista>[
      MinhaLista(
          'Procure adicionar recursos semânticos, disponíveis na tecnologia de desenvolvimento utilizada,'
          ' para dar informação ao usuário sobre mídias existentes, como botões.'
          ' '),
      MinhaLista(
          'Por exemplo: em Flutter, para descrever o que é um elemento no menu, utiliza-se, neste aplicativo, o elemento "tooltip" nas "ListTile".'),
    ],
  ),
  MinhaLista(
    'Descreva a finalidade de conteúdo(s) existente(s) que não possa(m) ser transcrito(s).',
    <MinhaLista>[
      MinhaLista(
          'Caso seja adicionado ao aplicativo algum conteúdo que não pode ser transcrito, adicione informações semânticas que descrevam a finalidade do item.\n'
          'Por exemplo: um exercício avaliativo que precisa ser exibido em formato de imagem, cuja a descrição compromete a resposta, deverá conter uma descrição'
          ' especificando a finalidade da imagem. '),
      MinhaLista(
          '[...]\n return: funcao_exercicio_avaliativo();\n semanticLabel: "Isto é uma avaliação visual que não pode ter seu conteúdo transcrito para não comprometer o contéudo da atividade"; \n[...]'),
    ],
  ),
  MinhaLista(
    'Descreva o(s) elemento(s) sensorial(ais) que possuam alguma finalidade no aplicativo. ',
    <MinhaLista>[
      MinhaLista(
          'Ao adicionar um elemento sensorial, como um toque musical de plano de fundo, ou um trabalho de arte visual, se este possuir algum objetivo além de decoração'
          ' ele deve ter sua finalidade descrita para o usuário. Atente-se aos detalhes que possam ser carregados, e utilize recursos semânticos para a descrição. Caso o'
          ' elemento não tenha um sentido, e está sendo utilizado como recurso decorativo ou ferramenta visual, então este deve ser ignorado pela tecnologia assistiva.')
    ],
  ),
  MinhaLista(
    'Disponibilize alternativas a elementos do tipo CAPTCHA presentes no aplicativo. ',
    <MinhaLista>[
      MinhaLista(
          'Estes elementos são utilizados como itens de segurança específicos para impedirem que aplicações automatizadas realizem determinada tarefa. '
          'Portanto, tecnologias assistivas podem ser afetadas por este tipo de elemento, e uma opção extra defe ser ofertada para usuários que possam ser impedidos pelo CAPTCHA.\n\n '
          'A W3C recomenda disponibilizar um método alternativo de autenticação para este tipo de usuário, ou um contato direto com o suporte que atenderá o caso específico.'),
    ],
  ),
  MinhaLista(
    'Descreva detalhadamente o conteúdo da mídia visual pré-gravada.',
    <MinhaLista>[
      MinhaLista(
        'Vídeos presentes no aplicativo devem ser descritos, não apenas legendados. Isso inclui a descrição de gestos e ações que não tem som, mas contenham informações'
        ' úteis ao usuário, como um gesto com as mãos que indiquem uma direção ou uma imagem de um produto presente no vídeo, que deverá ser descrito como "imagem do produto X". '
        'Deste modo, o usuário deficiente absorverá todas as informações transmitidas pelo do vídeo exibido. ',
      ),
    ],
  ),
  MinhaLista(
    'Organize as informações disponibilizadas nas telas do aplicativo.',
    <MinhaLista>[
      MinhaLista(
        'É importante manter as informações bem organizadas, indicando títulos, hiperlinks, campos de texto e elementos presentes na tela, como imagens. Assim, o usuário '
        'não ficará confuso ao ouvir a tecnologia assistiva ler as informações, e conseguira navegar sem problemas em seu aplicaivo. Não esqueça de adicionar o botão "sair" em seu aplicativo, pois auxilia '
        'o usuário deficiente visual a conseguir finalizar a utiização de seu app, e de indicar, através de elementos semânticos, as informações implícitas em textos com '
        'negrito, itálico, sublinhado, e/ou qualquer outro tipo de marcação que contenha informação anexa.',
      ),
    ],
  ),
  MinhaLista(
    'Escolha adequadamente a paleta de cores de seu aplicativo. ',
    <MinhaLista>[
      MinhaLista(
        'Cuide para que as cores que serão usadas em seu aplicativo estejam dentro dos padrões indicados pela W3C, considerando a relação de constraste nas fontes, para'
        ' que usuários que tenham algum tipo de daltonismo não sofram ao utilizarem seu aplicativo. ',
      ),
    ],
  ),
  MinhaLista(
    'Crie versões alternativas para nevação por leitores de tela',
    <MinhaLista>[
      MinhaLista(
        'Caso a estrutura do aplicativo influencie nas informações presentes na aplicação, organize-as de modo adaptado para leiores de tela. '
        'No código do programa, organize as estruturas de relações utilizando ferramentas para indicar listas, propagandas, links, etc.\n'
        'Para fazer isso, pode-se utilizar a estrutura semântica apresentada acima, e uma frase indicativa do conteúdo que será exibido, por exemplo:\n\n '
        '[...]\nsemanticLabel: "uma lista de hiperlinks será apresentada."[...]\n\n'
        '[...]semanticLabel: "uma propaganda sobre (x) está sendo exibida.[...]\n "',
      ),
    ],
  ),
  MinhaLista(
    'Possíveis erro(s) que sejam apresentados na exeução da aplicação devem ser devidamente tratado(s).',
    <MinhaLista>[
      MinhaLista(
        'É importante tratar os erros que podem ser apresentados no código, como uma mensagem de falha na conexão com o banco de dados ou erro de envio de dados através de um formulário. \n\n'
        'Existem, também, os erros de usabilidade que podem comprometer/dificultar a satisfação do usuário ao usar o App. Abaixo estão exemplificados dois tipos de erros que devem ser tratados na execução do programa.',
      ),
      MinhaLista(
        'Caso de uso 1: usuário clica no botão para efetuar a autenticação na tela inicial do aplicativo; um erro ocorre ao enviar os dados de autenticação para o servidor, e a tela do aplicativo não fornece nenhuma mensagem de \n feedback para o usuário. \n'
        'Neste caso, é apropriado que um retorno seja disponibilizado ao usuário, informando o motivo do erro e o que fazer. A criação de uma classe que apresente o erro de maneira menos "agressiva" e mais intuitiva ao usuário.\n'
        '\n Em Dart os erros críticos são apresentados em uma tela vermelha, com letras amarelas, aonde o usuário comum pode se perder - e um leitor de tela também. Veja uma classe que retorne uma tela de erro mais acessível:\n\n'
        'Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {\n  return Center(\n    child: Text(\n      "Aconteceu um erro :/",\n style: Theme.of(context).textTheme.title.copyWith(color: Colors.blue),\n    ),\n  );\n}',
      ),
      MinhaLista(
        'Caso de uso 2: um formulário de cadastro é preenchido pelo usuário contendo seus dados; ao clicar em "cadastrar" ocorre um erro e a página é recarregada. Entretanto, os dados do formulário são apagados;'
        ' Caso 2.1: o formulário não é apagado, mas o usuário não consegue identificar aonde ocorreu o erro porquê não existe uma mensagem, uma orientação visual informando aonde ele se encontra.'
        '\n Neste segundo caso, o programa deve retornar uma simbologia visual (com marcação semântica para leitores de tela), ou uma frase, que informe o erro ocorrido no formulário. Deve-se, também, evitar que os dados preenchidos sejam perdidos, e o usuário deve digitar tudo novamente. \n',
      ),
    ],
  ),
];
