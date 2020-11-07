import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/modules/home/home_module.dart';
import 'package:meu_cronograma/app/modules/home/home_page.dart';
import 'package:meu_cronograma/app/modules/home/listagem_curso.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  testWidgets('HomePage has logo', (tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final logoFinder = find.byType(LogoWidget);
      expect(logoFinder, findsOneWidget);
    });
  });

  testWidgets('HomePage has list', (tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final listagemCursoFinder = find.byType(ListagemCurso);
      expect(listagemCursoFinder, findsOneWidget);
    });
  });
}
