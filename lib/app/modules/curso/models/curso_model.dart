
import 'package:mobx/mobx.dart';

part 'curso_model.g.dart';

class CursoModel = BaseCursoModel with _$CursoModel;

abstract class BaseCursoModel with Store {
  @observable
  String nome;

  @observable
  String descricao;

  @action
  setDescricao(String descricao) {
    this.descricao = descricao;
  }

  @action
  setNome(String nome) {
    this.nome = nome;
  }

}