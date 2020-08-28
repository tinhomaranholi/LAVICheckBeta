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
      return ListTile(
          dense: true,
          enabled: true,
          subtitle: Text(""),
          selected: true,
          trailing: Icon(Icons.check),
          onTap: () async {
            const url =
                'https://flutter.dev/docs/development/accessibility-and-localization/accessibility';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            } else {
              throw 'não deu';
            }
          },
          title: Text(
            i.title,
            style: TextStyle(color: Colors.black87, fontSize: 18),
            textAlign: TextAlign.justify,
          ));

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
    <MinhaLista>[MinhaLista('Descrição de item')],
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
          ' Por exemplo: em Flutter, para descrever o que é um elemento no menu, utiliza-se, neste aplicativo, o elemento "tooltip" nas "ListTile".')
    ],
  ),
  MinhaLista(
    'Descreva a finalidade de conteúdo(s) existente(s) que não possa(m) ser transcrito(s).',
    <MinhaLista>[
      MinhaLista(
          'Caso seja adicionado ao aplicativo algum conteúdo que não pode ser transcrito, adicione informações semânticas que descrevam a finalidade do item.'
          ' Por exemplo: um exercício avaliativo que precisa ser exibido em formato de imagem, cuja a descrição compromete a resposta, deverá conter uma descrição'
          ' especificando a finalidade da imagem. '),
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
          'Portanto, tecnologias assistivas podem ser afetadas por este tipo de elemento, e uma opção extra defe ser ofertada para usuários que possam ser impedidos pelo CAPTCHA. '
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
    'Escolha a paleta te cores de seu aplicativo. ',
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
        'Caso a estrutura do aplicativo influencie as informações da aplicação, organize-as de modo adaptado para leiores de tela. '
        'No código do programa, organize as estruturas de relações utilizando ferramentas para indicar listas, propagandas, links, etc'
        'Para fazer isso, pode-se utilizar a estrutura semântica apresentada acima, e uma frase indicativa do conteúdo que será exibido, por exemplo: '
        'semanticLabel: "uma lista de hiperlinks será apresentada."'
        'semanticLabel: "uma propaganda sobre (x) está sendo exibida. "',
      ),
      MinhaLista(
        'novo item',
      ),
    ],
  ),
];
