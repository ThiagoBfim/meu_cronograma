import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'atividade_controller.g.dart';

@Injectable()
class AtividadeController = _AtividadeControllerBase with _$AtividadeController;

abstract class _AtividadeControllerBase with Store {

  final IAtividadeRepository _repository = Modular.get<IAtividadeRepository>();

  @observable
  List<AtividadeModel> _atividades = ObservableList<AtividadeModel>.of([AtividadeModel(nome: 'Conhecendo Widget')]);

  @action
  void saveAtividade(AtividadeModel atividadeModel) {
    _repository.saveAtividade(atividadeModel);
    if (_atividades.contains(atividadeModel)) {
      _atividades.remove(atividadeModel);
    }
    _atividades.add(atividadeModel);
  }

  @action
  deleteAtividade(AtividadeModel atividade) {
    _repository.deleteAtividade(atividade);
    _atividades.remove(atividade);
  }

  List<AtividadeModel> getAtividades(CursoModel curso) {
    if (_atividades.isEmpty) {
      return _repository.findAllAtividadesByCurso(curso);
    }
    return _atividades;
  }
}
