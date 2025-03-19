import 'package:mobx/mobx.dart';
import '../models/bolsista_model.dart';
import '../services/api_service.dart';
part 'cadastro_store.g.dart';

class  CadastroPagStore = _CadastroPagStore with _$CadastroPagStore;

abstract class _CadastroPagStore with Store {
  ApiService apiService = ApiService();

  @observable
  bool carregando = false;

  @observable 
  String nome = '';
  
  @observable
  String erroMsg = 'Erro ao cadastrar bolsista';

  @observable
  String sucessoMsg = 'Bolsista cadastrado com sucesso!';

  @observable
  DateTime dataNascimento = DateTime(2000, 1, 1);

  @observable
  String curso = '';

  @observable
  String comprovanteUrl = '';

  @action
  void setNome(String value) => nome = value;

  @action
  void setDataNascimento(DateTime value) => dataNascimento = value;

  @action
  void setCurso(String value) => curso = value;

  @action
  void setComprovanteUrl(String value) => comprovanteUrl = value;


  @action
  Future<bool> cadastrarBolsista() async{
    carregando = true;
    try{
      final bolsista = Bolsista(
        id: null,
        nome : nome,
        dataNascimento: dataNascimento,
        curso: curso,
        comprovanteUrl: comprovanteUrl,
      );
      
      final sucesso = await apiService.createBolsista(bolsista);

      runInAction(() {
      if (sucesso) {
        sucessoMsg = 'Bolsista cadastrado com sucesso!';
      } else {
        erroMsg = 'Erro ao cadastrar bolsista';
      }
    });
    return sucesso;
    }catch(e){
      runInAction(()=> erroMsg = 'Erro ao cadastrar bolsista: ${e.toString()}');
      return false;
    }
    finally{
    runInAction(()=> carregando = false);
  }
  }
}
  
