import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'curso_model.g.dart';

class CursoModel = BaseCursoModel with _$CursoModel;

abstract class BaseCursoModel with Store {
  @observable
  String nome;

  @observable
  String descricao;

  @observable
  Image logoImage = Image.asset("assets/images/camera-empty.png");

  @action
  setDescricao(String descricao) {
    this.descricao = descricao;
  }

  @action
  setNome(String nome) {
    this.nome = nome;
  }

  @action
  setLogoImage(Image logoImage) {
    this.logoImage = logoImage;
  }

  BaseCursoModel(
      {@required this.nome, @required this.descricao, this.logoImage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseCursoModel &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          descricao == other.descricao;

  @override
  int get hashCode => nome.hashCode ^ descricao.hashCode;
}
