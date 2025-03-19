import 'package:flutter/material.dart';
import 'package:ola_mundo/views/cadastro_page.dart';
import 'package:ola_mundo/views/atualizar_page.dart';
import 'package:ola_mundo/views/listar_pag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      
      title: 'Rede Campo - Bolsistas',
      initialRoute: '/listar', 

      routes: {
        '/cadastro': (context) => CadastroPag(),
        '/listar': (context) =>  ListarPag(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/atualizar') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return AtualizarPag(bolsistaId: args['id']);
            },
    );
  }
  return null;
 },
    );
  }
}
