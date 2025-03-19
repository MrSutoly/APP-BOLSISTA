import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../Services/api_service.dart';

class MostrarComprovante extends StatefulWidget {
  final int bolsistaId;

  const MostrarComprovante({super.key, required this.bolsistaId});

  @override
  _MostrarComprovanteState createState() => _MostrarComprovanteState();
}

class _MostrarComprovanteState extends State<MostrarComprovante> {
  String? filePath;
  bool isLoading = true;
  String? errorMessage;
  String? fileType;

  @override
  void initState() {
    super.initState();
    pegarComprovante();
  }

  Future<void> pegarComprovante() async {
    try {
      final comprovanteUrl = await ApiService().pegarComprovantePorId(widget.bolsistaId);
      final url = 'http://10.0.2.2:3000$comprovanteUrl';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final dir = await getTemporaryDirectory();
        final fileExten = comprovanteUrl.split('.').last;
        final fileName = 'temp.$fileExten';
        final file = File('${dir.path}/$fileName');

        await file.writeAsBytes(bytes, flush: true);

        setState(() {
          filePath = file.path;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Erro ao carregar o comprovante";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Erro ao baixar o arquivo: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exibir Comprovante',
      style: GoogleFonts.inter(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.w700,
      ),
      )
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage != null
                ? Text(errorMessage!, style: const TextStyle(color: Colors.red))
                : fileType =='pdf'
                ?PDFView(filePath: filePath!)
                :Image.file(File(filePath!)),
      ),
    );
  }
}
