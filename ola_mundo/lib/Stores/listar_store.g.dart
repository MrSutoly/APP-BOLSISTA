// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListarBolsistaStore on _ListarBolsistaStore, Store {
  late final _$carregandoAtom =
      Atom(name: '_ListarBolsistaStore.carregando', context: context);

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

  late final _$erroMsgAtom =
      Atom(name: '_ListarBolsistaStore.erroMsg', context: context);

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

  late final _$pegarBolsistasAsyncAction =
      AsyncAction('_ListarBolsistaStore.pegarBolsistas', context: context);

  @override
  Future<void> pegarBolsistas() {
    return _$pegarBolsistasAsyncAction.run(() => super.pegarBolsistas());
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
erroMsg: ${erroMsg}
    ''';
  }
}
