import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_controller.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_module.dart';

void main() {
  initModules([AppModule(), AtividadeModule()]);
  AtividadeController atividade;

  setUp(() {
        atividade = AtividadeModule.to.get<AtividadeController>();
  });

  group('AtividadeController Test', () {
      test("First Test", () {
        expect(atividade, isInstanceOf<AtividadeController>());
      });

      test("Get Atividades", () {
        int qtdAtividades = atividade.getAtividades(null).length;
        atividade.saveAtividade(AtividadeModel());
        expect(atividade.getAtividades(null).length, equals(qtdAtividades + 1));
      });
  });
}
