import 'dart:async';
import 'package:sqlite_bloc/database/database.dart';
import 'package:sqlite_bloc/model/todo.dart';

class TodoDao{
  final dbProvider = DatabaseProvider.dbProvider;

  //insert todo
  Future<int> createTodo(Todo todo) async {
    final db = await dbProvider.database;
    var result = db.insert(todoTABLE, todo.toDoDatabaseJson());
    return result;
  }

  //get all todo items
  Future<List<Todo>> getTodos({List<String> columns, String query}) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result;
    if(query != null){
      if(query.isNotEmpty)
        result = await db.query(todoTABLE, 
          columns: columns,
          where: 'description LIKE ?',
          whereArgs: ["%$query%"]);
    }else{
      result = await db.query(todoTABLE, columns: columns);
    }
    List<Todo> todos = result.isNotEmpty
      ? result.map((item) => Todo.fromDataseJson(item)).toList()
      : [];
    return todos;
  }

  //update todo
  Future<int> updateTodo(Todo todo) async {
    final db = await dbProvider.database;
    var result = await db.update(todoTABLE, todo.toDoDatabaseJson(), 
      where: "id = ?",
      whereArgs: [todo.id]
    );
    return result;
  }

  //delete todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //delete all todo records
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE);
    return result;
  }

}