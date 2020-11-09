import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'interfaces/curso_repository_interface.dart';

class CursoRepository implements ICursoRepository {

  Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "meu_cronograma.db");
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE IF NOT EXISTS TB_CURSO '
              ' (id INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' nome TEXT, '
              ' descricao TEXT,'
              ' link TEXT,'
              ' imagePath TEXT'
              ')');
          await db.execute('CREATE TABLE IF NOT EXISTS TB_ATIVIDADE '
              '(id INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' nome TEXT,'
              ' feito TEXT,'
              ' curso INTEGER'
              ')');
        });
  }

  List<CursoModel> cursos = [];

  @override
  void dispose() {
    //dispose will be called automatically
  }

  @override
  void save(CursoModel curso) async {
    final db = await getDatabase();
    if (cursos.contains(curso)) {
      db.update("TB_CURSO", curso.toMap(),
          where: 'id = ?', whereArgs: [curso.id]);
      cursos.remove(curso);
    } else {
      db.insert("TB_CURSO", curso.toMap());
    }
    cursos.add(curso);
  }

  @override
  void deleteCurso(CursoModel curso) async {
    cursos.remove(curso);
    final db = await getDatabase();
    db.delete("TB_CURSO", where: 'id = ?', whereArgs: [curso.id]);
  }

  @override
  Future<List<CursoModel>> findAllCursos() async {
    if (cursos.isEmpty) {
      cursos = await getCursosDb();
      return cursos;
    }
    return cursos;
  }

  Future<List<CursoModel>> getCursosDb() async {
    final db = await getDatabase();
    List<Map> list = await db.rawQuery("SELECT * FROM TB_CURSO ");
    return list.map((e) => CursoModel.fromDb(e)).toList();
  }
}
