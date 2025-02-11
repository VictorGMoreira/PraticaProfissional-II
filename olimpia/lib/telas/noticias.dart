import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasScreen extends StatelessWidget {
  final List<Map<String, String>> noticias = [
    {
      "titulo": "Saiu a classificação da QUIMENINAS, confira o edital no site",
      "categoria": "Olimpíadas de Química",
      "horario": "Há 3 horas",
      "local": "Em Site Oficial",
      "imagem": "assets/images/quimica.jpg",
      "url": "https://www.quimeninas.com.br" // Exemplo de URL
    },
    {
      "titulo": "Nova fase da OBMEP começa amanhã, veja os horários",
      "categoria": "Olimpíadas de Matemática",
      "horario": "Há 5 horas",
      "local": "Em OBMEP",
      "imagem": "assets/images/matematica.jpg",
      "url": "https://www.obmep.org.br" // Exemplo de URL
    },
    {
      "titulo": "Resultados da fase regional da OBF divulgados",
      "categoria": "Olimpíadas de Física",
      "horario": "Há 8 horas",
      "local": "Em OBF",
      "imagem": "assets/images/fisica.jpg",
      "url": "https://www.obf.org.br" // Exemplo de URL
    },
    {
      "titulo": "Confira os temas das redações para a OBR 2025",
      "categoria": "Olimpíadas de Robótica",
      "horario": "Há 1 dia",
      "local": "Em OBR",
      "imagem": "assets/images/robotica.jpg",
      "url": "https://www.obr.org.br" // Exemplo de URL
    },
    {
      "titulo": "Calendário atualizado das Olimpíadas de Astronomia",
      "categoria": "Olimpíadas de Astronomia",
      "horario": "Há 2 dias",
      "local": "Em OBA",
      "imagem": "assets/images/astronomia.jpg",
      "url": "https://www.astro.org.br" // Exemplo de URL
    }
  ];

  // Função para abrir a URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Notícias", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: noticias.length,
          itemBuilder: (context, index) {
            final noticia = noticias[index];
            return GestureDetector(
              onTap: () {
                // Chama a função para abrir a URL ao clicar no card
                _launchURL(noticia["url"]!);
              },
              child: Card(
                margin: EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 120, // Largura fixa para a imagem
                        height: 100, // Altura fixa para a imagem
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(noticia["imagem"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12), // Espaço entre a imagem e o texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticia["categoria"]!,
                              style: TextStyle(fontSize: 12, color: Color(0xFF4A99C3)), // Azul #4A99C3
                            ),
                            SizedBox(height: 4),
                            Text(
                              noticia["titulo"]!,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A99C3)), // Azul #4A99C3
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${noticia["horario"]} — ${noticia["local"]}",
                              style: TextStyle(fontSize: 12, color: Color(0xFF4A99C3)), // Azul #4A99C3
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
