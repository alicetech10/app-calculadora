import 'package:flutter/material.dart';
import 'calculadora.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 207, 136, 255),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: '🌟 CALCULADORA 📱'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double calcWidth = screenWidth * 0.8; 
    double calcHeight = screenHeight * 0.7; 

    calcWidth = calcWidth > 500 ? 500 : calcWidth; 
    calcHeight = calcHeight > 600 ? 600 : calcHeight; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Container(
                width: calcWidth,
                height: calcHeight,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 182, 193), 
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 105, 180), 
                    width: 3,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: const Calculadora(), 
              ),
            ),
          ),
          // Informações no rodapé
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: const Color.fromRGBO(148, 255, 250, 1), 
            child: const Column(
              children: [
                Text(
                  'Nome: Alice Maria P. Rodrigues',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Disciplina: Desenvolvimento Web',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Atividade: 3',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
