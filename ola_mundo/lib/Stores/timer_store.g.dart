// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStore, Store {
  Computed<String>? _$tempoFormatadoComputed;

  @override
  String get tempoFormatado =>
      (_$tempoFormatadoComputed ??= Computed<String>(() => super.tempoFormatado,
              name: '_TimerStore.tempoFormatado'))
          .value;

  late final _$segundosAtom =
      Atom(name: '_TimerStore.segundos', context: context);

  @override
  int get segundos {
    _$segundosAtom.reportRead();
    return super.segundos;
  }

  @override
  set segundos(int value) {
    _$segundosAtom.reportWrite(value, super.segundos, () {
      super.segundos = value;
    });
  }

  late final _$girandoAtom =
      Atom(name: '_TimerStore.girando', context: context);

  @override
  bool get girando {
    _$girandoAtom.reportRead();
    return super.girando;
  }

  @override
  set girando(bool value) {
    _$girandoAtom.reportWrite(value, super.girando, () {
      super.girando = value;
    });
  }

  late final _$vezesIniciadoAtom =
      Atom(name: '_TimerStore.vezesIniciado', context: context);

  @override
  int get vezesIniciado {
    _$vezesIniciadoAtom.reportRead();
    return super.vezesIniciado;
  }

  @override
  set vezesIniciado(int value) {
    _$vezesIniciadoAtom.reportWrite(value, super.vezesIniciado, () {
      super.vezesIniciado = value;
    });
  }

  late final _$vezesPausadoAtom =
      Atom(name: '_TimerStore.vezesPausado', context: context);

  @override
  int get vezesPausado {
    _$vezesPausadoAtom.reportRead();
    return super.vezesPausado;
  }

  @override
  set vezesPausado(int value) {
    _$vezesPausadoAtom.reportWrite(value, super.vezesPausado, () {
      super.vezesPausado = value;
    });
  }

  late final _$_TimerStoreActionController =
      ActionController(name: '_TimerStore', context: context);

  @override
  void iniciar() {
    final _$actionInfo =
        _$_TimerStoreActionController.startAction(name: '_TimerStore.iniciar');
    try {
      return super.iniciar();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pausar() {
    final _$actionInfo =
        _$_TimerStoreActionController.startAction(name: '_TimerStore.pausar');
    try {
      return super.pausar();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
segundos: ${segundos},
girando: ${girando},
vezesIniciado: ${vezesIniciado},
vezesPausado: ${vezesPausado},
tempoFormatado: ${tempoFormatado}
    ''';
  }
}
