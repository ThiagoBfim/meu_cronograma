import 'package:flutter/material.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';

import 'interfaces/curso_repository_interface.dart';

class CursoRepository implements ICursoRepository {
  List<CursoModel> cursos = [
    CursoModel(
        nome: "Lógica de programação essencial",
        descricao:
            "Lógica de programação é a forma como o desenvolvedor entende a comunicação a fim de programar uma função de um programa. Faz uso de algoritmos, que são sequências de passos bem estabelecidos, como por exemplo, uma receita de bolo.",
        logoImage: Image.network(
            "https://hermes.digitalinnovation.one/courses/badge/88cb0f8d-dcdb-4c7d-a9c5-c56d021a23b1.png")),
    CursoModel(
        nome: "Introdução ao Git e Controle de Versões",
        descricao:
            "Aprenda o que é controle de versão e como trabalhar com o Git, assim como os seus principais comandos.",
        logoImage: Image.network(
            "https://hermes.digitalinnovation.one/courses/badge/578303aa-e550-4a04-b668-a52f2d72c2c7.png")),
  ];

  @override
  void dispose() {
    //dispose will be called automatically
  }

  @override
  void save(CursoModel curso) {
    if (cursos.contains(curso)) {
      cursos.remove(curso);
    }
    cursos.add(curso);
  }

  @override
  void deleteCurso(CursoModel curso) {
    cursos.remove(curso);
  }

  @override
  List<CursoModel> findAllCursos() {
    return cursos;
  }
}
