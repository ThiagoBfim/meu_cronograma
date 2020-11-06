
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

import 'models/curso_model.dart';

class CursoForm extends StatefulWidget {

  final CursoModel curso;

  const CursoForm({Key key, this.curso}) : super(key: key);

  @override
  _CursoFormState createState() => _CursoFormState(curso);
}

class _CursoFormState extends State<CursoForm> {
  final ICursoRepository _repository = Modular.get<ICursoRepository>();

  final CursoModel curso;
  final _formKey = GlobalKey<FormState>();

  _CursoFormState(this.curso);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          alignment: WrapAlignment.end,
          spacing: 20,
          runSpacing: 10,
          children: <Widget>[
            Observer(
                builder: (_) => TextFormField(
                  validator: nomeValidator(),
                  onChanged: updateNome,
                  initialValue: curso.nome,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome"),
                  maxLength: 100,
                )),
            Observer(
                builder: (_) => TextFormField(
                  validator: nomeValidator(),
                  onChanged: updateDescricao,
                  initialValue: curso.descricao,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Descrição"),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 1000,
                )),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _repository.save(curso);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/", (_) => false);
                  }
                },
                child: Text('Salvar'))
          ],
        ),
      ),
    );
  }

  void updateNome(nome) {
    curso.setNome(nome);
  }

  void updateDescricao(descricao) {
    curso.setDescricao(descricao);
  }

  FieldValidator nomeValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}
