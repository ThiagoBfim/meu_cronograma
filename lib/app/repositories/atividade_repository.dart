import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';

import 'interfaces/atividade_repository_interface.dart';


class AtividadeRepository implements IAtividadeRepository {

  List<AtividadeModel> atividades = [
    AtividadeModel(nome: 'Conhecendo Widget', feito: true),
    AtividadeModel(nome: 'Conhecendo Scaffold', feito: false),
    AtividadeModel(nome: 'Conhecendo Navigator', feito: false)
  ];

  @override
  void dispose() {
    //dispose will be called automatically
  }

  @override
  void deleteAtividade(AtividadeModel atividade) {
    atividades.remove(atividade);
  }

  @override
  List<AtividadeModel> findAllAtividadesByCurso(CursoModel curso) {
    return atividades;
  }

  @override
  void saveAtividade(AtividadeModel atividade) {
    if (atividades.contains(atividade)) {
      atividades.remove(atividade);
    }
    atividades.add(atividade);
  }
}
