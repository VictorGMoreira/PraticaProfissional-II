import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class DetalhesOlimpiada extends StatelessWidget {
  final String titulo;
  final String periodoInscricao;
  final List<String> perguntas;
  final String linkInscricao;

  const DetalhesOlimpiada({
    Key? key,
    required this.titulo,
    required this.periodoInscricao,
    required this.perguntas,
    required this.linkInscricao,
  }) : super(key: key);

  // Função para mostrar o diálogo com a resposta da pergunta
  void _mostrarResposta(BuildContext context, String pergunta) {
    String resposta = "";
    
    if (pergunta == "Texto explicativo sobre o torneio.") {
      resposta = 'Quem pode participar da olimpíada?\n\n'
                 'Estudantes matriculadas no 8º e 9º ano do Ensino Fundamental no Nível A e estudantes matriculadas no Ensino Médio no Nível B.\n\n'
                 'Como funciona a competição?\n\n'
                 'A olimpíada tem duas fases:\n\n'
                 'A prova da 1ª Fase terá 15 questões objetivas, cada uma com 5 itens de múltipla escolha, a ser realizada de forma online.\n\n'
                 'A prova da 2ª Fase será discursiva e realizada em um único dia, composta de 5 questões com duração de 4 horas, a ser realizada de forma presencial.\n\n'
                 'Quais materiais são permitidos durante a prova?\n\n'
                 'Lápis, caneta, borracha, régua, transferidor e calculadora científica.\n\n'
                 'Quando e onde será realizada a prova?\n\n'
                 'A primeira fase é online e poderá ser realizada de qualquer lugar. Já a segunda fase será realizada nos locais de prova indicados no site. Na edição de 2024 foi realizada no dia 02/10 (sexta-feira), das 14h às 18h (Brasília).\n\n'
                 'Como funciona a premiação e a certificação?\n\n'
                 'As premiações serão:\n\n'
                 'Para cada ano/série dentro de cada nível, serão oferecidos prêmios às estudantes que obtiverem as melhores pontuações da Segunda Fase.\n\n'
                 '(a) Os prêmios serão nomeados de: Medalha de Ouro, Medalha de Prata e Medalha de Bronze.\n\n'
                 '(b) A quantidade de medalhas oferecidas atenderá aproximadamente a proporção 1 : 2 : 3 para medalhas de Ouro : Prata : Bronze para cada ano/série dentro de cada nível.\n\n'
                 'Serão oferecidas Menções Honrosas a critério da Comissão Organizadora do TFM.';
    } 
else if (pergunta == "Texto explicativo sobre a OBBIOTEC.") {
  resposta = 'Sobre as inscrições:\n\n'
             'A inscrição poderá ser feita pela escola onde o estudante estiver matriculado ou pelo próprio estudante.\n\n'
             'No caso de inscrição feita pelo próprio estudante, será necessário que este anexe no sistema, no momento de realização da inscrição, um comprovante informando nome completo do estudante, série em que está matriculado em 2024 e o nome da escola.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'O público alvo da OBBiotec são os jovens em curso do:\n\n'
             '● Oitavo e nono ano do Ensino Fundamental II (regular e Educação de Jovens e Adultos – EJA anos finais);\n\n'
             '● Ensino Médio (regular e EJA);\n\n'
             '● Ensino Técnico (integrado ao ensino médio, concomitante ou subsequente).\n\n'
             'Como funciona a competição?\n\n'
             'A olimpíada tem duas fases, a primeira você poderá realizar online em qualquer lugar. Já a segunda só poderá ser realizada online na sua escola, com o código de acesso que o professor vai dar.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Nenhum material é permitido durante a prova.';
} 
else if (pergunta == "Texto explicativo sobre a ONHB.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições para a ONHB serão feitas exclusivamente online, no site. Sob nenhuma hipótese as inscrições serão feitas por e-mail, correspondência ou qualquer outra forma de comunicação. As inscrições poderão ser pagas por boletos emitidos em nosso site ou cartão de crédito.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'O(a)s participantes formarão equipes compostas por um(a) professor(a) de história, pertencente ao corpo docente da escola, como orientador(a) e três estudantes regularmente matriculado(a)s ou no oitavo e nono anos (antigas sétima e oitava séries) do ensino fundamental ou no ensino médio. Assim, a composição da equipe (séries e idades do(a)s aluno(a)s que a integram) pode variar, desde que pertençam à mesma escola e ao mesmo nível de ensino: não é possível mesclar estudantes do ensino fundamental com aluno(a)s do ensino médio.';
}
else if (pergunta == "Texto explicativo sobre a OCHE") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são realizadas exclusivamente online.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Podem participar estudantes do ensino médio regularmente matriculados em escolas públicas e privadas do estado do Ceará.\n\n'
             'Como funciona a competição?\n\n'
             'A competição ocorre em 5 fases, sendo 4 delas online e a 5ª fase presencial. Da 1ª à 3ª fase, a equipe fará provas objetivas online. Na quarta fase, terão que fazer a produção de textos ou videocast para irem para a fase final.';
}
else if (pergunta == "Texto explicativo sobre a OBG.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições serão feitas exclusivamente online e devem ser feitas somente pelo Professor/a Orientador/a.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Podem participar estudantes do 9º ano do ensino fundamental e do ensino médio de todo o Brasil.\n\n'
             'Como funciona a competição?\n\n'
             'A OBG é composta por três fases online, nas quais os alunos devem resolver questões de geografia, análise de mapas e interpretação de dados.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Os participantes podem utilizar atlas, livros didáticos, calculadoras e outros materiais de pesquisa.';
}
else if (pergunta == "Texto explicativo sobre a OBA.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são feitas pelas escolas no site oficial da OBA, e a participação é gratuita.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental e médio de todo o Brasil podem participar, divididos em diferentes níveis.\n\n'
             'Como funciona a competição?\n\n'
             'A prova tem uma única fase, com questões objetivas sobre astronomia e astronáutica.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Apenas lápis, caneta, borracha e régua. Calculadoras e materiais de consulta não são permitidos.';
} 
else if (pergunta == "Texto explicativo sobre a OBI.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são realizadas pelas escolas no site oficial da OBI.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Podem participar da OBI todos os alunos de escolas regulares de Ensino Básico (Fundamental, Médio, Técnico ou Profissionalizante) e alunos que estejam cursando, pela primeira vez, o primeiro ano de um curso de graduação, no momento da prova da Fase Local da OBI.\n\n'
             'Como funciona a competição?\n\n'
             'A OBI tem diferentes níveis e categorias, desde lógica computacional até programação avançada, com fases online e presenciais.';
}
else if (pergunta == "Texto explicativo sobre a OBFEP.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são feitas pelas escolas no site oficial da OBFEP.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental e médio de escolas públicas podem participar.\n\n'
             'Como funciona a competição?\n\n'
             'A competição tem três fases: uma prova objetiva, uma prova discursiva e, para os melhores classificados, uma prova experimental.';
} 
else if (pergunta == "Texto explicativo sobre a OCQ.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são feitas pelas escolas no site oficial da OCQ.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino médio de escolas públicas e privadas do Ceará.\n\n'
             'Como funciona a competição?\n\n'
             'A olimpíada é dividida em fases, com questões objetivas e discursivas sobre química.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Caneta, lápis, borracha, calculadora científica e tabela periódica.';
}
else if (pergunta == "Texto explicativo sobre a ONC.") {
  resposta = 'Sobre as inscrições:\n\n'
             'As inscrições são feitas pelas escolas no site oficial da ONC.\n\n'
             'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental e do ensino médio de todo o Brasil.\n\n'
             'Como funciona a competição?\n\n'
             'A ONC tem duas fases, ambas compostas por questões objetivas de diversas áreas das ciências naturais.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Apenas lápis, caneta e borracha. Calculadoras e materiais de consulta não são permitidos.';
}
else if (pergunta == "Texto explicativo sobre a OBMEP.") {
  resposta = 'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental (a partir do 6º ano) e ensino médio de escolas públicas.\n\n'
             'Como funciona a competição?\n\n'
             'A competição é dividida em duas fases: uma prova objetiva e uma prova discursiva para os classificados da primeira fase.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Lápis, borracha e caneta. O uso de calculadoras e outros dispositivos eletrônicos não é permitido.';
} 
else if (pergunta == "Texto explicativo sobre a OBR.") {
  resposta = 'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental e médio de escolas públicas e privadas, organizados em equipes.\n\n'
             'Como funciona a competição?\n\n'
             'A competição tem duas modalidades: Prática (desafios com robôs) e Teórica (provas de conhecimento sobre robótica e tecnologia).\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Na modalidade Prática, as equipes utilizam kits de robótica aprovados pela organização. Na modalidade Teórica, apenas materiais autorizados previamente.';
}
else if (pergunta == "Texto explicativo sobre a Canguru.") {
  resposta = 'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental e médio de escolas públicas e privadas.\n\n'
             'Como funciona a competição?\n\n'
             'A prova é de múltipla escolha, com questões de raciocínio lógico e matemático, aplicada em um único dia.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Lápis, borracha e caneta. Não é permitido o uso de calculadoras ou materiais auxiliares.\n\n'
             'Quando e onde será realizada a prova?\n\n'
             'Realizada nas próprias escolas inscritas em data definida pela organização.';
} 
else if (pergunta == "Texto explicativo sobre a OBF.") {
  resposta = 'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino fundamental (9º ano), médio e universitários.\n\n'
             'Como funciona a competição?\n\n'
             'Dividida em três fases, com provas teóricas e experimentais.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Caneta esferográfica azul ou preta, régua, compasso e calculadora não programável.';
}
else if (pergunta == "Texto explicativo sobre a OQEP.") {
  resposta = 'Quem pode participar da olimpíada?\n\n'
             'Estudantes do ensino médio de escolas públicas.\n\n'
             'Como funciona a competição?\n\n'
             'Dividida em três fases, com provas objetivas e discursivas.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Caneta esferográfica azul ou preta, régua e calculadora científica não programável.';
}
else if (pergunta == "Texto explicativo sobre a OBGP.") {
  resposta = 'Como funciona a competição?\n\n'
             'A prova é composta por questões objetivas e dissertativas sobre geopolítica e relações internacionais.\n\n'
             'Quais materiais são permitidos durante a prova?\n\n'
             'Caneta esferográfica azul ou preta. Materiais adicionais podem variar conforme o regulamento.\n\n'
             'Quando e onde será realizada a prova?\n\n'
             'As provas ocorrem em datas definidas pela organização e são aplicadas nas escolas participantes.';
}
else if(pergunta =="Texto explicativo sobre as fases."){
  resposta = 'Como funciona?\n\n'
            'A quimeninas é totalmente online e gratuita, tem fase única que pode ser realizada online (caso a inscrição tenha sido realizada por você) ou presencialmente na sua escola (caso a inscrição tenha sido realizada pelo professor).\n\n'
            'Quem pode participar?\n\n'
            'A quimeninas é uma competição nacional de Química destinada às meninas regularmente matriculadas no 9º ano do ensino fundamental ao 2º ano do ensino médio de todo o Brasil.\n\n'
            'Quais materiais são permitidos durante a prova?\n\n'
            'Papel em branco, caneta, calculadora científica e a tabela periódica.';
}

 else {
  resposta = "Aqui vai a resposta para: $pergunta";
}
 


      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(pergunta),
          content: Text(resposta),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  // Função para retornar a imagem correspondente com base no título
  String _obterImagemOlimpiada(String titulo) {
    switch (titulo) {
    case "QUIMENINAS":
      return 'assets/imagens/Quimeninas.jpg';
    case "Torneio de Física para Meninas (TFM)":
      return 'assets/imagens/TorneioDeFísicaParaMeninas.jpg';
    case "Olimpíada brasileira de Biotecnologia (OBBiotec)":
      return 'assets/imagens/OlimpíadaBrasileiradeBiotecnologia.jpg';
    case "Olimpíada Nacional de História do Brasil (ONHB)":
      return 'assets/imagens/OlimpíadaNacionaldeHistóriadoBrasil.jpg';
    case "Olimpíada de Ciências Humanas do Estado do Ceará (OCHE)":
      return 'assets/imagens/OlimpíadadeCiênciasHumanasdoEstadodoCeará.jpg';
    case "Olimpíada Brasileira de Geografia (OBG)":
      return 'assets/imagens/OlimpíadaBrasileiradeGeografia.jpg';
    case "Olimpíada Brasileira de Astronomia (OBA)":
      return 'assets/imagens/OlimpíadaBrasileiradeAstronomia.jpg';
    case "Olimpíada Brasileira de Informática (OBI)":
      return 'assets/imagens/OlimpíadaBrasileiradeInformática.jpg';
    case "Olimpíada Brasileira de Física das Escolas Públicas (OBFEP)":
      return 'assets/imagens/OlimpíadaBrasileiradeFísicadasEscolasPúblicas.jpg';
    case "Olimpíada Cearense de Química (OCQ)":
      return 'assets/imagens/OlimpíadaCearensedeQuímica.jpg';
    case "Olimpíada Nacional de Ciências (ONC)":
      return 'assets/imagens/OlimpíadaNacionaldeCiências.jpg';
    case "Olimpíada Brasileira de Matemática das Escolas Públicas (OBMEP)":
      return 'assets/imagens/OlimpíadaBrasileiradeMatemáticadasEscolasPúblicas.jpg';
    case "Olimpíada Brasileira de Robótica (OBR)":
      return 'assets/imagens/OlimpíadaBrasileiradeRobótica.jpg';
    case "Canguru Matemática":
      return 'assets/imagens/CanguruMatemática.jpg';
    case "Olimpíada Brasileira de Física (OBF)":
      return 'assets/imagens/OlimpíadaBrasileiradeFísica.jpg';
    case "Olimpíada de Química de Escolas Públicas (OQEP)":
      return 'assets/imagens/OlimpíadadeQuímicadeEscolasPúblicas.jpg';
    case "Olimpíada Brasileira de Geopolítica (OBGP)":
      return 'assets/imagens/OlimpíadaBrasileiradeGeopolítica.jpg';
    default:
      return 'assets/imagens/default.jpg';  // Imagem padrão caso não encontre a olimpíada
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exibindo a imagem correspondente à olimpíada
          Container(
            height: 200, // Altura do retângulo
            width: double.infinity, // Largura ocupando toda a tela
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_obterImagemOlimpiada(titulo)), // Caminho da imagem baseado no título
                fit: BoxFit.cover, // Ajusta a imagem para cobrir o retângulo
              ),
            ),
          ),
          const SizedBox(height: 16.0), // Espaçamento após o retângulo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Período de inscrições: $periodoInscricao",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Perguntas frequentes:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                // Mapeando para criar as perguntas clicáveis
                ...perguntas.map((pergunta) => GestureDetector(
                      onTap: () => _mostrarResposta(context, pergunta),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            pergunta,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 16.0),
                Text(
                  "Quer se inscrever?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => _launchURL(linkInscricao), // Função para abrir o link
                  child: Text(
                    linkInscricao,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, // Deixar o link sublinhado
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }
}