import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_form.dart';
import 'package:meu_cronograma/app/shared/background_box_decoration.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

import 'atividade_controller.dart';
import 'listagem_atividade.dart';

class AtividadePage extends StatefulWidget {
  final CursoModel curso;

  const AtividadePage({Key key, @required this.curso})
      : assert(curso != null, 'Curso não pode ser null');

  @override
  _AtividadePageState createState() => _AtividadePageState(curso);
}

class _AtividadePageState
    extends ModularState<AtividadePage, AtividadeController> {
  //use 'controller' variable to access controller
  final CursoModel curso;

  _AtividadePageState(this.curso);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoWidget(
          image: CircleAvatar(child: curso.logoImage),
          title: curso.nome,
        ),
      ),
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListagemAtividade(curso: curso),
              MaterialButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black54,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => createDialog()),
                child: Text(
                  'Adicionar nova atividade',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              // ),
              // )
            ],
          ),
        ),
      ),
    );
  }


  createDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Nova Atividade',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              AtividadeForm(
                atividade: AtividadeModel.empty(curso: curso),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
