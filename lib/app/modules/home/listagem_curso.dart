import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/home/progress_list_bar.dart';
import 'package:meu_cronograma/app/modules/home/web_view_curso.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

class ListagemCurso extends StatelessWidget {
  final ICursoRepository _repository = Modular.get<ICursoRepository>();
  final IAtividadeRepository _atividadeRepository =
      Modular.get<IAtividadeRepository>();

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
            child: _buildListTile(curso, context),
            actions: [
              Visibility(
                visible: curso.link != null,
                child: IconSlideAction(
                  caption: 'Acessar',
                  color: Colors.yellow[600],
                  icon: Icons.send,
                  onTap: () => _navigateToWebView(curso.link, context),
                ),
              ),
            ],
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

  ListTile _buildListTile(CursoModel curso, BuildContext context) {
    var atividades = _atividadeRepository.findAllAtividadesByCurso(curso);
    var qtdAtividadeConcluido =
        atividades.where((element) => element.feito == true).length;

    return ListTile(
      onTap: () => _navigateToAtividades(curso, context),
      leading: CircleAvatar(
        child: curso.logoImage,
      ),
      title: Text(
        curso.nome,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        children: [
          Text(
            curso.descricao,
            style: TextStyle(color: Colors.white70),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          atividades.length > 0
              ? ProgressListBar(
                  percentConcluido:
                      (qtdAtividadeConcluido / atividades.length).toDouble())
              : Container()
        ],
      ),
    );
  }

  _navigateToWebView(String url, BuildContext context) {
    return Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => WebViewCurso(url: url)));
  }

  _navigateToEdit(CursoModel curso, BuildContext context) {
    Navigator.of(context).pushNamed(AppModule.NEW_CURSO, arguments: curso);
  }

  _deleteCurso(CursoModel curso) {
    _repository.deleteCurso(curso);
  }

  _navigateToAtividades(CursoModel curso, BuildContext context) {
    Navigator.of(context).pushNamed(AppModule.ATIVIDADES, arguments: curso);
  }
}
