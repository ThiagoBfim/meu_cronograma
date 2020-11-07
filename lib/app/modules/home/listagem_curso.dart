
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

class ListagemCurso extends StatelessWidget {
  final ICursoRepository _repository = Modular.get<ICursoRepository>();

  @override
  Widget build(BuildContext context) {
    var cursos = _repository.findAllCursos();
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (builder, index) {
          CursoModel curso = cursos[index];
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              leading: CircleAvatar(
                child: curso.logoImage,
              ),
              title: Text(
                curso.nome,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                curso.descricao,
                style: TextStyle(color: Colors.white70),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Editar',
                color: Colors.black45,
                icon: Icons.edit,
                onTap: () => _navigateToEdit(curso, context),
              ),
              IconSlideAction(
                caption: 'Deletar',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _deleteCurso(curso),
              ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
        itemCount: cursos.length);
  }

  _navigateToEdit(CursoModel curso, BuildContext context) {
    Navigator.of(context).pushNamed(AppModule.NEW_CURSO, arguments: curso);
  }

  _deleteCurso(CursoModel curso) {
    _repository.deleteCurso(curso);
  }
}
