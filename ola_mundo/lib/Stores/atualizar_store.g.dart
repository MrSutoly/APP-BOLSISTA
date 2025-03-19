// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atualizar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Atualizarstore on _Atualizarstore, Store {
  late final _$carregandoAtom =
      Atom(name: '_Atualizarstore.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$bolsistaIdAtom =
      Atom(name: '_Atualizarstore.bolsistaId', context: context);

  @override
  int? get bolsistaId {
    _$bolsistaIdAtom.reportRead();
    return super.bolsistaId;
  }

  @override
  set bolsistaId(int? value) {
    _$bolsistaIdAtom.reportWrite(value, super.bolsistaId, () {
      super.bolsistaId = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_Atualizarstore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$dataNascimentoAtom =
      Atom(name: '_Atualizarstore.dataNascimento', context: context);

  @override
  DateTime get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(DateTime value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  late final _$cursoAtom =
      Atom(name: '_Atualizarstore.curso', context: context);

  @override
  String get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(String value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  late final _$comprovanteUrlAtom =
      Atom(name: '_Atualizarstore.comprovanteUrl', context: context);

  @override
  String get comprovanteUrl {
    _$comprovanteUrlAtom.reportRead();
    return super.comprovanteUrl;
  }

  @override
  set comprovanteUrl(String value) {
    _$comprovanteUrlAtom.reportWrite(value, super.comprovanteUrl, () {
      super.comprovanteUrl = value;
    });
  }

  late final _$carregarBolsistaAsyncAction =
      AsyncAction('_Atualizarstore.carregarBolsista', context: context);

  @override
  Future<bool> carregarBolsista(int id) {
    return _$carregarBolsistaAsyncAction.run(() => super.carregarBolsista(id));
  }

  late final _$atualizarBolsistaAsyncAction =
      AsyncAction('_Atualizarstore.atualizarBolsista', context: context);

  @override
  Future<bool> atualizarBolsista() {
    return _$atualizarBolsistaAsyncAction.run(() => super.atualizarBolsista());
  }

  late final _$_AtualizarstoreActionController =
      ActionController(name: '_Atualizarstore', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_AtualizarstoreActionController.startAction(
        name: '_Atualizarstore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_AtualizarstoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(DateTime value) {
    final _$actionInfo = _$_AtualizarstoreActionController.startAction(
        name: '_Atualizarstore.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_AtualizarstoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurso(String value) {
    final _$actionInfo = _$_AtualizarstoreActionController.startAction(
        name: '_Atualizarstore.setCurso');
    try {
      return super.setCurso(value);
    } finally {
      _$_AtualizarstoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComprovanteUrl(String value) {
    final _$actionInfo = _$_AtualizarstoreActionController.startAction(
        name: '_Atualizarstore.setComprovanteUrl');
    try {
      return super.setComprovanteUrl(value);
    } finally {
      _$_AtualizarstoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
bolsistaId: ${bolsistaId},
nome: ${nome},
dataNascimento: ${dataNascimento},
curso: ${curso},
comprovanteUrl: ${comprovanteUrl}
    ''';
  }
}
