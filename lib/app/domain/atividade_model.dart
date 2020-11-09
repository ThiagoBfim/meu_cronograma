import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'curso_model.dart';

part 'atividade_model.g.dart';

class AtividadeModel = BaseAtividadeModel with _$AtividadeModel;

abstract class BaseAtividadeModel with Store {

  int id;

  @observable
  String nome;

  @observable
  bool feito = false;

  CursoModel curso;

  @action
  setNome(String nome) {
    this.nome = nome;
  }

  @action
  setFeito(bool feito) {
    this.feito = feito;
  }

  BaseAtividadeModel.empty({@required this.curso});

  BaseAtividadeModel(
      {@required this.nome, @required this.curso, this.feito = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseAtividadeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
