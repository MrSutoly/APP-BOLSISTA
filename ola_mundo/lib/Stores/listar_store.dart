import 'package:mobx/mobx.dart';
import '../models/bolsista_model.dart';
import '../services/api_service.dart';
part 'listar_store.g.dart';

    class ListarBolsistaStore = _ListarBolsistaStore with _$ListarBolsistaStore;

    abstract class _ListarBolsistaStore with Store{
      ApiService apiService = ApiService();

      ObservableList<Bolsista> bolsistas = ObservableList<Bolsista>();

      @observable
      bool carregando = false;

      String sucessoMsg='Sucesso ao listar Bolsistas';
      
      @observable
      String erroMsg = 'Erro ao Carregar Bolsistas';

      @action
      Future<void> pegarBolsistas() async{
        try{
          runInAction(() => carregando = true);
          List<Bolsista> lista = await apiService.getBolsistas();

          runInAction((){  
          bolsistas.clear();
          bolsistas.addAll(lista);
          });

          runInAction(()=> sucessoMsg);
        }
        catch(e){
          runInAction(()=> erroMsg);
        }finally{
          runInAction(() => carregando = false);
        }
      }
    }