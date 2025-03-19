import 'package:mobx/mobx.dart';
import '../models/bolsista_model.dart';
import '../services/api_service.dart';
import 'dart:io';
part 'atualizar_store.g.dart';

class Atualizarstore = _Atualizarstore with _$Atualizarstore;

abstract class _Atualizarstore with Store {
  final ApiService apiService = ApiService();

  @observable
  bool carregando = false;

  @observable
  int? bolsistaId;

  Bolsista? _bolsistaOriginal;

  @observable
  String nome = '';

  String erroMsg = '';

  String sucessoMsg = '';

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
  Future<bool> carregarBolsista(int id) async {
    try {
      runInAction(() => carregando = true);

      final bolsista = await apiService.pegarPorId(id);

      _bolsistaOriginal = bolsista;

      runInAction(() {
        bolsistaId = bolsista.id;
        nome = bolsista.nome;
        dataNascimento = bolsista.dataNascimento;
        curso = bolsista.curso;
        comprovanteUrl = bolsista.comprovanteUrl;
        erroMsg = '';
      });

      return true;
    } catch (e) {
      runInAction(() => erroMsg = 'Erro ao carregar dados: ${e.toString()}');
      return false;
    } finally {
      runInAction(() => carregando = false);
    }
  }

  Map<String, dynamic> _obterCamposAlterados() {
    if (_bolsistaOriginal == null || bolsistaId == null) {
      return {};
    }

    final Map<String, dynamic> alteracoes = {};

    if (nome != _bolsistaOriginal!.nome) {
      alteracoes['nome_completo'] = nome;
    }

    if (dataNascimento!= _bolsistaOriginal!.dataNascimento) {
      alteracoes['data_nascimento'] = dataNascimento;
    }

    if (curso != _bolsistaOriginal!.curso) {
      alteracoes['curso'] = curso;
    }

    bool novoArquivoSelecionado = 
      comprovanteUrl != _bolsistaOriginal!.comprovanteUrl && 
      !comprovanteUrl.startsWith('http') && 
      !comprovanteUrl.startsWith('/uploads/') &&
      comprovanteUrl.isNotEmpty && 
      comprovanteUrl != _bolsistaOriginal!.comprovanteUrl;
  
      if (novoArquivoSelecionado) {
    alteracoes['comprovante'] = comprovanteUrl;
  }
    return alteracoes;
  }

  @action
  Future<bool> atualizarBolsista() async {
    if (bolsistaId == null) {
      runInAction(() => erroMsg = 'ID do bolsista não definido');
      return false;
    }

    try {
      runInAction(() => carregando = true);

      final camposAlterados = _obterCamposAlterados();

      if (camposAlterados.isEmpty) {
        runInAction(() => sucessoMsg = 'Nenhuma alteração detectada');
        return true;
      }

      final bolsistaAtualizado = Bolsista(
        id: bolsistaId,
        nome: nome,
        dataNascimento: dataNascimento,
        curso: curso,
        comprovanteUrl: comprovanteUrl,
      );

      File? comprovanteFile;
    if (camposAlterados.containsKey('comprovante')) {
      try {
        comprovanteFile = File(comprovanteUrl);
        final exists = await comprovanteFile.exists();

        if (!exists) {
          print("Arquivo não encontrado: $comprovanteUrl");
          runInAction(
            () => erroMsg = 'Arquivo não encontrado no caminho especificado',
          );
          return false;
        }
      } catch (e) {
        print("Erro ao acessar arquivo: $e");
        runInAction(
          () => erroMsg = 'Erro ao acessar arquivo: ${e.toString()}',
        );
        return false;
      }
    }

      final sucesso = await apiService.updateBolsista(
        bolsistaAtualizado,
        comprovanteFile: comprovanteFile,
      );

      runInAction(() {
        if (sucesso) {
          sucessoMsg = 'Bolsista atualizado com sucesso!';
        }
      });

      return sucesso;
    } catch (e) {
      runInAction(() => erroMsg = 'Erro ao atualizar: ${e.toString()}');
      return false;
    } finally {
      runInAction(() => carregando = false);
    }
  }
}
