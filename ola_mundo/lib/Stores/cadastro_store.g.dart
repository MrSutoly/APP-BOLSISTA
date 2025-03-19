// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroPagStore on _CadastroPagStore, Store {
  late final _$carregandoAtom =
      Atom(name: '_CadastroPagStore.carregando', context: context);

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

  late final _$nomeAtom =
      Atom(name: '_CadastroPagStore.nome', context: context);

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

  late final _$erroMsgAtom =
      Atom(name: '_CadastroPagStore.erroMsg', context: context);

  @override
  String get erroMsg {
    _$erroMsgAtom.reportRead();
    return super.erroMsg;
  }

  @override
  set erroMsg(String value) {
    _$erroMsgAtom.reportWrite(value, super.erroMsg, () {
      super.erroMsg = value;
    });
  }

  late final _$sucessoMsgAtom =
      Atom(name: '_CadastroPagStore.sucessoMsg', context: context);

  @override
  String get sucessoMsg {
    _$sucessoMsgAtom.reportRead();
    return super.sucessoMsg;
  }

  @override
  set sucessoMsg(String value) {
    _$sucessoMsgAtom.reportWrite(value, super.sucessoMsg, () {
      super.sucessoMsg = value;
    });
  }

  late final _$dataNascimentoAtom =
      Atom(name: '_CadastroPagStore.dataNascimento', context: context);

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
      Atom(name: '_CadastroPagStore.curso', context: context);

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
      Atom(name: '_CadastroPagStore.comprovanteUrl', context: context);

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

  late final _$cadastrarBolsistaAsyncAction =
      AsyncAction('_CadastroPagStore.cadastrarBolsista', context: context);

  @override
  Future<bool> cadastrarBolsista() {
    return _$cadastrarBolsistaAsyncAction.run(() => super.cadastrarBolsista());
  }

  late final _$_CadastroPagStoreActionController =
      ActionController(name: '_CadastroPagStore', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CadastroPagStoreActionController.startAction(
        name: '_CadastroPagStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroPagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(DateTime value) {
    final _$actionInfo = _$_CadastroPagStoreActionController.startAction(
        name: '_CadastroPagStore.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_CadastroPagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurso(String value) {
    final _$actionInfo = _$_CadastroPagStoreActionController.startAction(
        name: '_CadastroPagStore.setCurso');
    try {
      return super.setCurso(value);
    } finally {
      _$_CadastroPagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComprovanteUrl(String value) {
    final _$actionInfo = _$_CadastroPagStoreActionController.startAction(
        name: '_CadastroPagStore.setComprovanteUrl');
    try {
      return super.setComprovanteUrl(value);
    } finally {
      _$_CadastroPagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
nome: ${nome},
erroMsg: ${erroMsg},
sucessoMsg: ${sucessoMsg},
dataNascimento: ${dataNascimento},
curso: ${curso},
comprovanteUrl: ${comprovanteUrl}
    ''';
  }
}
