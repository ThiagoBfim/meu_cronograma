import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'curso_controller.dart';
import 'curso_form.dart';
import 'models/curso_model.dart';

class CursoPage extends StatefulWidget {

  @override
  _CursoPageState createState() => _CursoPageState();
}

class _CursoPageState extends ModularState<CursoPage, CursoController> {

  CursoModel curso = CursoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Observer(builder: (_) => Text(curso.nome ?? ''))
      ),
      body: CursoForm(curso: curso),
    );
  }
}
