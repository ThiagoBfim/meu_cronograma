// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursoModel on BaseCursoModel, Store {
  final _$nomeAtom = Atom(name: 'BaseCursoModel.nome');

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

  final _$descricaoAtom = Atom(name: 'BaseCursoModel.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$BaseCursoModelActionController =
      ActionController(name: 'BaseCursoModel');

  @override
  dynamic setDescricao(String descricao) {
    final _$actionInfo = _$BaseCursoModelActionController.startAction(
        name: 'BaseCursoModel.setDescricao');
    try {
      return super.setDescricao(descricao);
    } finally {
      _$BaseCursoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String nome) {
    final _$actionInfo = _$BaseCursoModelActionController.startAction(
        name: 'BaseCursoModel.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$BaseCursoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
descricao: ${descricao}
    ''';
  }
}
