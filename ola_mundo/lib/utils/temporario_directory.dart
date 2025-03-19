import 'dart:io';
import 'package:path_provider/path_provider.dart';

  Future<void> limparCacheTemp() async{
    try{
      final tempDir = await getTemporaryDirectory();
      final dire = Directory(tempDir.path);

      if(dire.existsSync()){
        await for (var file in dire.list()){
        if (file is File && file.path.contains('temp_')) {
            await file.delete();
          }
        }
      }
    }catch(e){
      print("Erro ao limpar cache temporario: $e");
    }
  }

  