import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ola_mundo/utils/file_picker_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ola_mundo/Stores/cadastro_store.dart';
import 'package:ola_mundo/utils/theme_app.dart';

class CadastroPag extends StatefulWidget {
  const CadastroPag({super.key});

  @override
  State<CadastroPag> createState() => _CadastroPagState();
}

class _CadastroPagState extends State<CadastroPag> {
  final CadastroPagStore store = CadastroPagStore();
  final _formKey = GlobalKey<FormState>();
  final ThemeApp themeApp = ThemeApp();

  Future<void> _selecionarArq() async {
    String? filePath = await selecionarArq();
    if (filePath != null) {
      store.setComprovanteUrl(filePath);
    } else {
      store.erroMsg = 'Erro ao selecionar arquivo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeApp.cadastroBackColor2,
      appBar: AppBar(
        title:  Text(
          'Cadastro De Bolsista',
          style: GoogleFonts.inter(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: themeApp.textColor2,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor:  themeApp.cadastroAppColor1,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Observer(
                builder:
                    (_) => TextFormField(
                      autofillHints: null,
                      decoration: InputDecoration(
                      hintText: "Nome Completo",
                      hintStyle: TextStyle(
                        color: themeApp.textColor,
                        fontSize: 17,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeApp.cadastroAppColor1,
                          width: 2,
                        ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeApp.borderColor,
                            width: 4,
                          )
                        )
                      ),
                      onChanged: store.setNome,
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Campo obrigatório' : null,
                    ),
              ),

              SizedBox(height: 23),

              Observer(
                builder: (_) {
                  final controller = TextEditingController(
                    text: "${store.dataNascimento.day}/${store.dataNascimento.month}/${store.dataNascimento.year}"
                  );
                  
                  return TextFormField(
                    autofillHints: null, 
                    decoration: InputDecoration(
                      labelText: "Data de Nascimento",
                      labelStyle: TextStyle(
                        color: themeApp.textColor,
                        fontSize: 19,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeApp.cadastroAppColor1,
                          width: 2,
                        ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeApp. borderColor,
                            width: 4,
                          )
                        ),
                     suffixIcon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 69, 69, 69),),
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
                                primary: themeApp.cadastroAppColor1,   
                                onPrimary: themeApp.buttonBackgroundColor,                          
                                onSurface: Color.fromARGB(255, 69, 69, 69),        
                              ),
                              
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                foregroundColor: themeApp.cadastroAppColor1, 
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      
                      if (data != null) {
                        store.setDataNascimento(data);
                      }
                    },
                  );
                },
              ),

              SizedBox(height: 20),

              Observer(
                builder:
                    (_) => TextFormField(
                      autofillHints: null, 
                      decoration: InputDecoration(
                        hintText: "Curso",
                        hintStyle: TextStyle(
                          color: themeApp.textColor,
                          fontSize: 17,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeApp.cadastroAppColor1, 
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: themeApp.borderColor,
                            width: 4,
                        )
                        )
                        ),
                      onChanged: store.setCurso,
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Campo obrigatório' : null,
                    ),
              ),

              SizedBox(height: 20),

              Observer(
                builder:
                    (_) =>
                        store.comprovanteUrl.isNotEmpty
                            ? Text(
                              "Arquivo Selecionado: ${store.comprovanteUrl}",
                            )
                            : Text("Nenhum arquivo Selecionado"),
                     ),

              SizedBox(height: 20),

              Observer(
                builder:
                    (_) =>
                        store.carregando
                      ? Center(child: CircularProgressIndicator(color: themeApp.cadastroAppColor1))

                      : ElevatedButton(
                        onPressed: _selecionarArq,

                        style: ElevatedButton.styleFrom(
                        backgroundColor: themeApp.buttonBackgroundColor,
                        shadowColor: themeApp.sombraColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        ),
                        ),

                        child: Text("Selecionar Arquivo (PDF OU JPEG)",
                        style: TextStyle(
                          color: themeApp.buttonPdfTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        ),
               ),

              SizedBox(height: 20),

              Observer(
                builder:
                    (_) => ElevatedButton(
                      onPressed:
                          store.carregando
                              ? null
                              : () async {
                                if (_formKey.currentState!.validate()) {
                                  final sucesso =
                                      await store.cadastrarBolsista();
                                      if(mounted){ 
                                  if (sucesso) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(store.sucessoMsg)),
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(store.erroMsg)),
                                    );
                                  }
                                }
                                }
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeApp.buttonBackgroundColor,
                        shadowColor: themeApp.sombraColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child:
                          store.carregando
                              ? null
                              : Text(
                                "Cadastrar-Se",
                                style: TextStyle(
                                  color: themeApp.cadastrobuttonColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
