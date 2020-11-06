import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/modules/curso/models/curso_model.dart';

abstract class ICursoRepository implements Disposable {
  void save(CursoModel curso);
}
