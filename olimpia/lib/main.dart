import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'telas/inicial.dart';
import 'telas/noticias.dart';
import 'telas/calendario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);  // Configura a localidade para o formato de data
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olimpíadas Estudantis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de Olimpíadas com datas de início e fim
  final List<Map<String, String>> _olimpiadas = [
    {"titulo": "QUIMENINAS", "inicio": "2025-12-19", "fim": "2026-01-07"},
    {"titulo": "MATEMÁTICA UNIVERSITÁRIA", "inicio": "2026-01-10", "fim": "2026-02-25"},
    {"titulo": "BIOOLIMPÍADAS", "inicio": "2026-03-15", "fim": "2026-04-20"},
    {"titulo": "FÍSICA OLÍMPICA", "inicio": "2026-06-01", "fim": "2026-07-15"},
  ];

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      Inicial(),
      CalendarioScreen(olimpiadas: _olimpiadas), // Passando as Olimpíadas
      NoticiasScreen(),
      Center(child: Text("Perfil")),  // Substitua por uma tela de perfil real
    ];
  }

  // Função para alternar entre as abas
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olimpia", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: _telas[_selectedIndex],  // Exibe a tela baseada no índice selecionado
     bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor: Color(0xFF376F8D), // Cor do ícone selecionado
  unselectedItemColor: Color(0xFF376F8D).withOpacity(0.6), // Cor dos ícones não selecionados
  type: BottomNavigationBarType.fixed, // Remover a animação de transição e manter a navegação fixa
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorar"),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendário"),
    BottomNavigationBarItem(icon: Icon(Icons.article), label: "Notícias"),
  ],
)

    );
  }
}
