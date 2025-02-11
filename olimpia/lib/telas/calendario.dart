import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarioScreen extends StatefulWidget {
  final List<Map<String, dynamic>> olimpiadas;

  CalendarioScreen({required this.olimpiadas});

  @override
  _CalendarioScreenState createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends State<CalendarioScreen> {
  DateTime _selectedMonth = DateTime.now();
  Map<DateTime, String> _eventos = {};
  late List<int> anosDisponiveis;

  @override
  void initState() {
    super.initState();
    _carregarEventos();
    anosDisponiveis = List<int>.generate(2031 - 2000, (index) => 2000 + index);
  }

  void _carregarEventos() {
    Map<DateTime, String> eventos = {};
    for (var olimp in widget.olimpiadas) {
      DateTime inicio = DateTime.parse(olimp["inicio"]);
      DateTime fim = DateTime.parse(olimp["fim"]);
      eventos[inicio] = "${olimp["titulo"]} - Início";
      eventos[fim] = "${olimp["titulo"]} - Fim";
    }
    setState(() {
      _eventos = eventos;
    });
  }

  void _changeMonth(DateTime newDate) {
    setState(() {
      _selectedMonth = newDate;
    });
    _carregarEventos();
  }

  void _nextMonth() {
    _changeMonth(DateTime(_selectedMonth.year, _selectedMonth.month + 1, 1));
  }

  void _previousMonth() {
    _changeMonth(DateTime(_selectedMonth.year, _selectedMonth.month - 1, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A99C3),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('MMMM yyyy', 'en_US').format(_selectedMonth).toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              onPressed: _showYearDropdown,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavigationButtons(),
          Expanded(child: _buildCalendar()),
          _buildImportantes(),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: _previousMonth),
          IconButton(icon: const Icon(Icons.arrow_forward, color: Colors.black), onPressed: _nextMonth),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    int daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
    int firstWeekday = DateTime(_selectedMonth.year, _selectedMonth.month, 1).weekday;

    // Ajusta a quantidade de espaços vazios antes do primeiro dia do mês
    List<Widget> days = List.generate(firstWeekday, (index) => SizedBox(width: 30, height: 30));

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(_selectedMonth.year, _selectedMonth.month, day);
      bool hasEvent = _eventos.containsKey(date);

      days.add(GestureDetector(
        onLongPress: () {
          if (hasEvent) {
            _showEventDetails(date);
          }
        },
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hasEvent ? Colors.blueAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(
            "$day",
            style: TextStyle(color: hasEvent ? Colors.white : Colors.black87),
          ),
        ),
      ));
    }

    // Calcula quantos quadradinhos faltam para completar a linha
    int totalDays = daysInMonth + firstWeekday;
    int rows = (totalDays / 7).ceil();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        itemCount: rows * 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          int dayIndex = index - firstWeekday;
          if (dayIndex >= 0 && dayIndex < daysInMonth) {
            DateTime date = DateTime(_selectedMonth.year, _selectedMonth.month, dayIndex + 1);
            bool hasEvent = _eventos.containsKey(date);

            return GestureDetector(
              onLongPress: () {
                if (hasEvent) {
                  _showEventDetails(date);
                }
              },
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: hasEvent ? Colors.blueAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Text(
                  "${dayIndex + 1}",
                  style: TextStyle(color: hasEvent ? Colors.white : Colors.black87),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void _showEventDetails(DateTime date) {
    String eventDetails = _eventos[date] ?? "Sem eventos";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Evento em ${DateFormat('dd/MM/yyyy').format(date)}'),
          content: Text(eventDetails),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _showYearDropdown() async {
    int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Escolha um Ano"),
          content: SizedBox(
            height: 300,
            width: 100,
            child: ListView.builder(
              itemCount: anosDisponiveis.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(anosDisponiveis[index].toString(),
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.pop(context, anosDisponiveis[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selectedYear != null) {
      setState(() {
        _selectedMonth = DateTime(selectedYear, _selectedMonth.month, 1);
      });
      _carregarEventos();
    }
  }

  Widget _buildImportantes() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Eventos Importantes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          ...widget.olimpiadas.map((olimp) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF438DB5),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  ),
                  onPressed: () => _showOlimpiadaDetails(olimp),
                  child: Text(
                    olimp["titulo"],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _showOlimpiadaDetails(Map<String, dynamic> olimp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(olimp["titulo"]),
          content: Text("Data da Prova: ${olimp["prova"]}\nInscrição Final: ${olimp["fim"]}\nResultado: ${olimp["resultado"]}"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Fechar')),
          ],
        );
      },
    );
  }
}
