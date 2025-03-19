import 'package:mobx/mobx.dart';
import '../services/api_service.dart';
part 'delete_store.g.dart';


class DeleteStore = _DeleteStore with _$DeleteStore;

abstract class _DeleteStore with Store{
  ApiService apiService = ApiService();

  @observable
  bool carregando = false;

  @observable
  String erroMsg = 'Erro ao deletar Bolsistas!';

  @observable
  String sucessoMsg = 'Bolsista excluido!';

  @action
  Future<bool> deletarBolsista(int id) async{
    carregando = true;
    try{
      final sucesso = await apiService.deleteBolsista(id);
      if(sucesso){
        runInAction(() => sucessoMsg);
        return true;
      }
    }catch(e){
     runInAction(() => erroMsg);
     return false;
    }finally{
      runInAction(() => carregando = false);
    }
    return false;
  }
}