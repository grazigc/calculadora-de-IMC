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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 36, 43, 141)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
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
  // ignore: unused_field
  int _counter = 0;
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/imagens/IMC.jpeg')),
              const Text(
                'Calculadora de IMC',
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: InputDecoration(
                    labelText: 'PESO',
                    hintText: 'DIGITE SEU PESO',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: InputDecoration(
                    labelText: 'ALTURA',
                    hintText: 'DIGITE SUA ALTURA',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(resultadoIMC,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double peso = double.parse(
                            controllerPeso.text.replaceAll(',', '.'));
                        double altura = double.parse(
                            controllerAltura.text.replaceAll(',', '.'));

                        if (altura != 0) {
                          double conta = peso / (altura * altura);
                          resultadoIMC = conta.toStringAsFixed(2);
                          if (conta < 18.5) {
                            resultadoIMC += '\nABAIXO DO PESO';
                          } else if (conta >= 18.5 && conta < 24.9) {
                            resultadoIMC += '\nPESO NORMAL';
                          } else if (conta >= 25.0 && conta < 29.9) {
                            resultadoIMC += '\nSOBREPESO';
                          } else {
                            resultadoIMC += '\nOBESIDADE';
                          }
                        }
                      });
                    },
                    child: const Text('CALCULAR')),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              resultadoIMC = '';
            });
          },
          child: Text('LIMPAR RESULTADO')),
    );
  }
}
