import 'package:flutter/material.dart';
import 'detalhes_olimpiada.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/olimpia_card.dart'; // Certifique-se de que o caminho está correto
import '../widgets/search_bar.dart' as CustomSearchBar;

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '';

  final List<Map<String, dynamic>> _olimpiadas = [
    {
      "titulo": "QUIMENINAS",
      "periodo": "19 de dezembro a 7 de janeiro",
      "categoria": "Química",
      "perguntas": ["Quantas fases?", "Texto explicativo sobre as fases."],
      "link": "https://www.seinscrevenfb.com",
    },
    {
  "titulo": "Torneio de Física para Meninas (TFM)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Física",
  "perguntas": ["Texto explicativo sobre o torneio."],
  "link": "https://tfcbr.inf.ufsm.br/fisica",
},

{
  "titulo": "Olimpíada brasileira de Biotecnologia (OBBiotec)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Biologia",
  "perguntas": ["Texto explicativo sobre a OBBIOTEC."],
  "link": "https://www.obbiotec.com.br/?fbclid=PAZXh0bgNhZW0CMTEAAab6tXEc1XevyumrjyU4cDesQBsLDWgxlXuYu8H9NMm87-36RwCGk2mx1u0_aem_LFFhxDj_5Vt19BgONS6sYg",
},

{
  "titulo": "Olimpíada Nacional de História do Brasil (ONHB)",
  "periodo": "Inscrições abertas! Realize sua inscrição até 25/04.",
  "categoria": "História",
  "perguntas": ["Texto explicativo sobre a ONHB."],
  "link": "https://www.olimpiadadehistoria.com.br/",
},

{
  "titulo": "Olimpíada de Ciências Humanas do Estado do Ceará (OCHE)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Ciências Humanas",
  "perguntas": ["Texto explicativo sobre a OCHE."],
  "link": "https://oche.ifce.edu.br/",
},

{
  "titulo": "Olimpíada Brasileira de Geografia (OBG)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Geografia",
  "perguntas": ["Texto explicativo sobre a OBG."],
  "link": "https://obgeografia.com.br/",
},

{
  "titulo": "Olimpíada Brasileira de Astronomia (OBA)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Astronomia",
  "perguntas": ["Texto explicativo sobre a OBA."],
  "link": "http://www.oba.org.br/site/?fbclid=PAZXh0bgNhZW0CMTEAAaakUYFe4d0KaHwmrkKnyn4RbxpP_xYy3CFlQiTc7E2oWMjFcu3umjRVwK0_aem_qB7zC5xdeuMx6GFGKm6GGQ",
},

{
  "titulo": "Olimpíada Brasileira de Informática (OBI)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Informática",
  "perguntas": ["Texto explicativo sobre a OBI."],
  "link": "https://olimpiada.ic.unicamp.br/",
},

{
  "titulo": "Olimpíada Brasileira de Física das Escolas Públicas (OBFEP)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Física",
  "perguntas": ["Texto explicativo sobre a OBFEP."],
  "link": "indisponível",
},

{
  "titulo": "Olimpíada Cearense de Química (OCQ)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Química",
  "perguntas": ["Texto explicativo sobre a OCQ."],
  "link": "https://ceara.obquimica.org/?fbclid=PAZXh0bgNhZW0CMTEAAaYEQXoUe_KGxYQwS_3XderstpFxvtuSI2CcoaTtcqjuMGqJjeI-UmRbLwo_aem_TB_MoKHKzoZWQAQbF1tWbg",
},

{
  "titulo": "Olimpíada Nacional de Ciências (ONC)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Ciências",
  "perguntas": ["Texto explicativo sobre a ONC."],
  "link": "https://www.onciencias.org/",
},

{
  "titulo": "Olimpíada Brasileira de Matemática das Escolas Públicas (OBMEP)",
  "periodo": "Inscrições abertas! Escola, realize sua inscrição até 17/03.",
  "categoria": "Matemática",
  "perguntas": ["Texto explicativo sobre a OBMEP."],
  "link": "http://www.obmep.org.br/",
},

{
  "titulo": "Olimpíada Brasileira de Robótica (OBR)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Robótica",
  "perguntas": ["Texto explicativo sobre a OBR."],
  "link": "https://obr.robocup.org.br/?fbclid=PAZXh0bgNhZW0CMTEAAaaF7xdIsxcnUT-k7LvZ_hrshe5r05ROzycdazXsx6zsnDP2mJiYMSbFgbo_aem_mtgXd7ySPJf4UR1QC0ahmg",
},

{
  "titulo": "Canguru Matemática",
  "periodo": "Inscrições abertas!",
  "categoria": "Matemática",
  "perguntas": ["Texto explicativo sobre a Canguru."],
  "link": "https://www.cangurudematematicabrasil.com.br/",
},

{
  "titulo": "Olimpíada Brasileira de Física (OBF)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Física",
  "perguntas": ["Texto explicativo sobre a OBF."],
  "link": "indisponível",
},

{
  "titulo": "Olimpíada de Química de Escolas Públicas (OQEP)",
  "periodo": "Olimpíada encerrada.",
  "categoria": "Química",
  "perguntas": ["Texto explicativo sobre a OQEP."],
  "link": "https://oqep.ifce.edu.br/?fbclid=PAZXh0bgNhZW0CMTEAAaZM6uliJRGiwSv5kbGs2BD0eaJWRzS3vWFV8vg855n3XwGfmS4TvJ_aEC0_aem_1Wg52OiVgXYVz8X331JwkA",
},

{
  "titulo": "Olimpíada Brasileira de Geopolítica (OBGP)",
  "periodo": "Inscrições abertas! Inscreva-se até 01/04.",
  "categoria": "Geopolítica",
  "perguntas": ["Texto explicativo sobre a OBGP."],
  "link": "https://www.seletaeducacao.com.br/obgp",
},

  ];

  List<Map<String, dynamic>> _filteredOlimpiadas = [];

  // Controle para os filtros
  bool isMatematicaSelected = false;
  bool isBiologiaSelected = false;
  bool isQuimicaSelected = false;
  bool isOutrasMateriasSelected = false;

  @override
  void initState() {
    super.initState();
    _filteredOlimpiadas = List.from(_olimpiadas);

    _searchController.addListener(() {
      _filterOlimpiadas();
    });
  }

  void _filterOlimpiadas() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredOlimpiadas = _olimpiadas.where((olimp) {
        final matchesSearch = olimp["titulo"].toLowerCase().contains(query);
        final matchesCategory = _selectedCategory.isEmpty ||
            olimp["categoria"] == _selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  // Função para abrir o link da olimpíada
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      isMatematicaSelected = category == 'Matemática';
      isBiologiaSelected = category == 'Biologia';
      isQuimicaSelected = category == 'Química';
      isOutrasMateriasSelected = category == 'Outras matérias';
      _filterOlimpiadas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomSearchBar.SearchBar(
            hintText: "Busque por olimpíadas",
            controller: _searchController,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 8.0),
                  FilterChip(
                    label: const Text("Matemática"),
                    selected: isMatematicaSelected,
                    selectedColor: Color(0xFF438DB5),
                    onSelected: (value) {
                      _selectCategory(value ? 'Matemática' : '');
                    },
                  ),
                  const SizedBox(width: 8.0),
                  FilterChip(
                    label: const Text("Biologia"),
                    selected: isBiologiaSelected,
                    selectedColor: Color(0xFF438DB5),
                    onSelected: (value) {
                      _selectCategory(value ? 'Biologia' : '');
                    },
                  ),
                  const SizedBox(width: 8.0),
                  FilterChip(
                    label: const Text("Química"),
                    selected: isQuimicaSelected,
                    selectedColor: Color(0xFF438DB5),
                    onSelected: (value) {
                      _selectCategory(value ? 'Química' : '');
                    },
                  ),
                  const SizedBox(width: 8.0),
                  FilterChip(
                    label: const Text("Outras matérias"),
                    selected: isOutrasMateriasSelected,
                    selectedColor: Color(0xFF438DB5),
                    onSelected: (value) {
                      _selectCategory(value ? 'Outras matérias' : '');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Resultados da busca",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _filteredOlimpiadas.isEmpty
                ? const Text("Nenhuma olimpíada encontrada.")
                : Column(
                    children: _filteredOlimpiadas
                        .map(
                          (olimp) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: OlimpiaCard(
                              title: olimp["titulo"],
                              periodoInscricao: olimp["periodo"],
                              perguntas: List<String>.from(olimp["perguntas"]),
                              linkInscricao: olimp["link"],
                              onTap: () {
                                // Navegar para a tela de detalhes
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetalhesOlimpiada(
                                      titulo: olimp["titulo"],
                                      periodoInscricao: olimp["periodo"],
                                      perguntas: List<String>.from(olimp["perguntas"]),
                                      linkInscricao: olimp["link"],
                                    ),
                                  ),
                                );
                              },
                              // Adicionando o link dentro do card
                              linkWidget: InkWell(
                                onTap: () {
                                  _launchURL(olimp["link"]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Quer se inscrever? Clique aqui',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
