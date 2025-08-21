import 'package:aula2/raca.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Aula 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Raca> racas = [];

  Future<void> _buscarRacas() async {
    final dio = Dio();
    final response = await dio.get('https://dogapi.dog/api/v2/breeds');

    racas = response.data["data"].map<Raca>((element) {
      return Raca.fromJson(element);
    }).toList();

    for (var raca in racas) {
      raca.imagem = await _buscarImagem(raca.nome!);
    }

    setState(() {});
  }

  Future<String> _buscarImagem(String raca) async {
    try {
      final dio = Dio();
      final response = await dio.get("https://dog.ceo/api/breeds/image/random");

      return response.data["message"];
    } catch (e) {
      return "https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg";
    }
  }

  void _incrementCounter() {
    _counter++;
    setState(() {});
  }

  void _decrementCounter() {
    _counter--;
    setState(() {});
  }

  @override
  void initState() {
    _buscarRacas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: racas.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text("Raça: ${racas[index].nome}"),
                        Text("Descrição: ${racas[index].descricao}"),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Image.network(racas[index].imagem!)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Padding(padding: EdgeInsets.all(5)),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
