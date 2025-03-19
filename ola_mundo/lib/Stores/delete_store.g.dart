// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteStore on _DeleteStore, Store {
  late final _$carregandoAtom =
      Atom(name: '_DeleteStore.carregando', context: context);

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
      Atom(name: '_DeleteStore.erroMsg', context: context);

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
      Atom(name: '_DeleteStore.sucessoMsg', context: context);

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

  late final _$deletarBolsistaAsyncAction =
      AsyncAction('_DeleteStore.deletarBolsista', context: context);

  @override
  Future<bool> deletarBolsista(int id) {
    return _$deletarBolsistaAsyncAction.run(() => super.deletarBolsista(id));
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
erroMsg: ${erroMsg},
sucessoMsg: ${sucessoMsg}
    ''';
  }
}
