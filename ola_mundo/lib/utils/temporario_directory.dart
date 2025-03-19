import 'dart:io';
import 'package:path_provider/path_provider.dart';

  Future<void> limparCacheTemp() async{
    try{
      final dir = await getTemporaryDirectory();
      final dire = Directory(dir.path);

      if(dire.existsSync()){
        await for (var file in dire.list()){
          if(file is File){
            await file.delete();
          }
        }
      }
    }catch(e){
      print("Erro ao limpar cache temporario: $e");
    }
  }

  