import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/modules/home/home_module.dart';
import 'package:meu_cronograma/app/modules/home/home_page.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

void main() {
  initModule(HomeModule());
  testWidgets('HomePage has logo', (tester) async {
     await tester.pumpWidget(buildTestableWidget(HomePage()));
     final logoFinder = find.byType(LogoWidget);
     expect(logoFinder, findsOneWidget);
  });
}
