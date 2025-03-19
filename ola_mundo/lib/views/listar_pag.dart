import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ola_mundo/Stores/atualizar_store.dart';
import 'package:ola_mundo/Stores/delete_store.dart';
import 'package:ola_mundo/Stores/listar_store.dart';
import 'package:ola_mundo/views/mostrar_arq.dart';
import 'package:ola_mundo/views/timer_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListarPag extends StatefulWidget {
  @override
  _ListarPagState createState() => _ListarPagState();
}

class _ListarPagState extends State<ListarPag> {
  final ListarBolsistaStore store = ListarBolsistaStore();
  final Atualizarstore atualizarStore = Atualizarstore();
  final DeleteStore deleteStore = DeleteStore();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.pegarBolsistas();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 230, 197),
      appBar: AppBar(
        title: Text(
          'Listagem de Bolsistas',
          style: GoogleFonts.inter(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 189, 47),
        leading: GestureDetector(
          onTap: () async {
            await store.pegarBolsistas();
          },
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset('assets/images/fazenda.png', width: 18),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cadastro');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/add.png',
                width: 34,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),

      body: Observer(
        builder: (_) {
          if (store.carregando) {
            return Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 255, 186, 47),
              ),
            );
          }
          if (store.bolsistas.isEmpty) {
            return Center(
              child: Text(
                'Nenhum bolsista encontrado',
                style: TextStyle(
                  color: const Color.fromARGB(255, 30, 30, 30),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: store.bolsistas.length,
            itemBuilder: (context, index) {
              final bolsista = store.bolsistas[index];
              return Card(
                elevation: 6,
                shadowColor: const Color.fromARGB(255, 255, 136, 0),
                margin: EdgeInsets.all(10),
                child: ExpansionTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 28,
                        icon: Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 80, 221, 118), 
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                          context,
                          '/atualizar',
                          arguments: {'id': bolsista.id},
                        );
                        store.pegarBolsistas();
                        },
                      ),
                      
                      IconButton(
                        iconSize: 28,
                        icon: Icon(
                          Icons.timer,
                          color: Color.fromARGB(255, 50, 163, 255),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      TimerPage(nomeBolsista: bolsista.nome),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        iconSize: 28,
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 88, 50),
                        ),
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('Confirmar Exclusão'),
                                  content: Text(
                                    'Deseja realmente excluir o bolsista ${bolsista.nome}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancelar'),
                                    ),

                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);

                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder:
                                              (context) => Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      color:
                                                          const Color.fromARGB(255, 18, 255, 14),
                                                    ),
                                              ),
                                        );

                                        bool sucesso = await deleteStore.deletarBolsista(bolsista.id!);

                                        if (!context.mounted) return;
                                        Navigator.pop(context);

                                        if (sucesso) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Bolsista Excluído com sucesso!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    232,
                                                    232,
                                                    232,
                                                  ),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    255,
                                                    93,
                                                    216,
                                                    97,
                                                  ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              duration: Duration(seconds: 5),
                                            ),
                                          );
                                          store.pegarBolsistas();
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Erro ao deletar o bolsista: ${deleteStore.erroMsg}",
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    232,
                                                    232,
                                                    232,
                                                  ),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    255,
                                                    228,
                                                    69,
                                                    66,
                                                  ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              duration: Duration(seconds: 5),
                                            ),
                                          );
                                        }
                                      },
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                title: Text(
                   bolsista.nome,
                   style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                     )
                  ),
                  subtitle: Text(
                    'Id: ${bolsista.id}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      ),
                  ),
                  initiallyExpanded: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromARGB(255, 255, 170, 1),
                      width: 2,
                    ),
                  ),
                children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Data de Nascimento: ${DateFormat('dd/MM/yyyy').format(bolsista.dataNascimento)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                            ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                              'Curso: ${bolsista.curso}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            ),
                            trailing: IconButton(
                        iconSize: 34,
                        icon: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: Color.fromARGB(255, 255, 65, 65),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => MostrarComprovante(
                                    bolsistaId: bolsista.id!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/*                     IconButton(
                        iconSize: 28,
                        icon: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: Color.fromARGB(255, 255, 17, 17),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => MostrarComprovante(
                                    bolsistaId: bolsista.id!,
                                  ),
                            ),
                          );
                        },
                      ),
                      */
