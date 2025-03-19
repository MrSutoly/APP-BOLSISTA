import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ola_mundo/Stores/atualizar_store.dart';
import 'package:ola_mundo/views/mostrar_arq.dart';
import 'package:ola_mundo/utils/file_picker_util.dart';
import 'package:google_fonts/google_fonts.dart';

class AtualizarPag extends StatefulWidget {
  final int bolsistaId;

  AtualizarPag({required this.bolsistaId});

  @override
  State<AtualizarPag> createState() => _AtualizarPagState();
}

class _AtualizarPagState extends State<AtualizarPag> {
  late Atualizarstore store;

  Future<void> _selecionarArq() async{
    String? filepath = await selecionarArq();
    if(filepath != null){
      store.setComprovanteUrl(filepath);
    }else{
      store.erroMsg = 'Erro ao selecionar arquivo';
    }
  }


  @override
  void initState() {
    super.initState();
    store = Atualizarstore();
    store.carregarBolsista(widget.bolsistaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 255, 197),
      appBar: AppBar(
        title: Text(
          'Atualizar Bolsista',
          style: GoogleFonts.inter(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 67, 200, 0),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (store.carregando) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.erroMsg.isNotEmpty) {
            return Center(child: Text(store.erroMsg));
          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      autofillHints: null, 
                      onChanged: store.setNome,
                      decoration: InputDecoration(
                        hintText: "Nome",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 255, 30),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 160, 19),
                            width: 4,
                          ),
                        ),
                      ),
                      controller: TextEditingController(text: store.nome),
                    );
                  },
                ),

                SizedBox(height: 16),

                Observer(
                  builder: (_) {
                    final controller = TextEditingController(
                      text:
                          "${store.dataNascimento.day}/${store.dataNascimento.month}/${store.dataNascimento.year}",
                    );

                    return TextFormField(
                      autofillHints: null, 
                      decoration: const InputDecoration(
                        labelText: "Data de Nascimento",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 19,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 255, 30),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 160, 19),
                            width: 4,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 69, 69, 69),
                        ),
                      ),
                      controller: controller,
                      readOnly: true,
                      onTap: () async {
                        final data = await showDatePicker(
                          context: context,
                          initialDate: store.dataNascimento,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Color.fromARGB(255, 0, 255, 30),
                                  onPrimary: Colors.white,
                                  onSurface: Color.fromARGB(255, 69, 69, 69),
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Color.fromARGB(255, 0, 160, 19),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (data != null) {
                          store.setDataNascimento(data);
                          controller.text =
                              "${data.day}/${data.month}/${data.year}";
                        }
                      },
                    );
                  },
                ),

                SizedBox(height: 16),

                Observer(
                  builder: (_) {
                    return TextFormField(
                      autofillHints: null, 
                      onChanged: store.setCurso,
                      decoration: InputDecoration(
                        hintText: "Curso",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 255, 30),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 160, 19),
                            width: 4,
                          ),
                        ),
                      ),
                      controller: TextEditingController(text: store.curso),
                    );
                  },
                ),

                SizedBox(height: 38),

                Observer(
                builder:(_) => store.comprovanteUrl.isNotEmpty
                ?Text("${store.nome} possui comprovante.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                ) 
                :Text("${store.nome} não possui comprovante.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                ),
                ),

                SizedBox(height: 50),

                Observer(
                  builder:
                      (_) => ElevatedButton(
                        onPressed:
                            store.comprovanteUrl.isNotEmpty
                                ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (_) => MostrarComprovante(
                                            bolsistaId: widget.bolsistaId,
                                          ),
                                    ),
                                  );
                                }
                                : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          foregroundColor: const Color.fromARGB(
                            255,
                            255,
                            109,
                            25,
                          ),
                          disabledBackgroundColor: Colors.grey[300],
                          disabledForegroundColor: Colors.grey[600],
                          shadowColor: Color.fromARGB(255, 0, 0, 0),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.picture_as_pdf, size: 28),
                              SizedBox(height: 4),
                              Text(
                                'Ver Comprovante',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ),

                SizedBox(height: 48),

                Observer(
                  builder:
                  (_)=> ElevatedButton(
                  onPressed: _selecionarArq,
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255,255,255,255),
                        shadowColor: Color.fromARGB(255, 0, 0, 0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        ),
                  ),
                  child: Text('Selecionar Comprovante',
                  style: TextStyle(
                  color: const Color.fromARGB(255, 0, 171, 20),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                    )
                  )
                  )
                ),

                SizedBox(height: 50),

                Observer(
                  builder:
                      (_) => ElevatedButton(
                        onPressed: () async {
                          final sucesso = await store.atualizarBolsista();
                          if (sucesso) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Bolsista atualizado com sucesso!',
                                ),
                              ),
                            );
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Erro ao atualizar bolsista!'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255,255,255,255),
                          foregroundColor: const Color.fromARGB(255, 0, 171, 20),
                          shadowColor: Color.fromARGB(255, 0, 0, 0),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text('Atualizar Bolsista: ${store.nome}',
                        style: TextStyle(
                        fontSize: 20,
                        ),
                        ),
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
