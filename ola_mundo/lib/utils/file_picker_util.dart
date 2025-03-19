import 'package:file_picker/file_picker.dart';

Future<String?> selecionarArq() async {
    try {
      FilePickerResult? resultado = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpeg'],
      );
      
      if (resultado != null && resultado.files.isNotEmpty && resultado.files.single.path != null) {
        String filePath = resultado.files.single.path!;
        
        if (filePath.isNotEmpty) {
          print("Arquivo selecionado: $filePath");
          return filePath;
        } else {
          print("Caminho do arquivo vazio");
          return null;
        }
      } else {
        print("Nenhum arquivo selecionado ou resultado nulo");
        return null;
      }
    } catch (e) {
      print("Erro ao selecionar arquivo: $e");
      return null;    
    }
  }