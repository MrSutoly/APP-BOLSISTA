import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ola_mundo/Stores/timer_store.dart';

class TimerPage extends StatefulWidget {
    final String nomeBolsista;

  const TimerPage({super.key, required this.nomeBolsista});
  
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final TimerStore store = TimerStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 251, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 163, 255),
        centerTitle: true,
        title: const Text(
          'Cronometro',
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),

          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 50, 163, 255),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 50, 50, 50),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  widget.nomeBolsista,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'É hora de trabalhar!',
                  style: const TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 70),

          Center(
            child: Observer(
              builder:
                  (_) => Text(
                    store.tempoFormatado,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),

          SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder:
                    (_) => ElevatedButton(
                      onPressed: store.girando ? store.pausar : store.iniciar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: store.girando ? Color.fromARGB(255, 154, 0, 80) :  Color.fromARGB(255, 11, 131, 135),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        store.girando ? 'Pausar' : 'Iniciar',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              ),

              SizedBox(width: 20),
            ],
          ),

          SizedBox(height: 100),

          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Observer(
                builder:
                    (_) => Text(
                      'INICIADO: ${store.vezesIniciado} ${store.vezesIniciado == 1 ? 'VEZ' : 'VEZES'}',
                      style: const TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 11, 131, 135),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
            ),
          ),

          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Observer(
                builder:
                    (_) => Text(
                      'PAUSADO: ${store.vezesPausado} ${store.vezesPausado == 1 ? 'VEZ' : 'VEZES'}',
                      style: const TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 154, 0, 80),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
