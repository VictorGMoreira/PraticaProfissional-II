import 'package:flutter/material.dart';

class OlimpiaCard extends StatelessWidget {
  final String title;
  final String periodoInscricao;
  final List<String> perguntas;
  final String linkInscricao;
  final VoidCallback onTap;
  final Widget? linkWidget; // Novo parâmetro

  const OlimpiaCard({
    required this.title,
    required this.periodoInscricao,
    required this.perguntas,
    required this.linkInscricao,
    required this.onTap,
    this.linkWidget, // Aceita um widget opcional
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      title.substring(0, 1),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    "Período de inscrições:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(periodoInscricao),
              const SizedBox(height: 12),
              Text(
                "Perguntas frequentes:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ...perguntas.map((pergunta) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        pergunta,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  )),
              const SizedBox(height: 12),
              Text(
                "Quer se inscrever?",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              linkWidget ?? Text( // Exibe o link ou widget customizado
                linkInscricao,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
