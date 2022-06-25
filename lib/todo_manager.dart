import 'dart:io';

class TodoManager {
  File storage;
  Map todos = {};

  TodoManager({required this.storage}) {
    checkExistsStorage();
    todos = getTodosFromStorage();
  }

  void checkExistsStorage() {
    if (!storage.existsSync()) {
      storage.createSync();
    }
  }

  Map getTodosFromStorage() {
    return {...storage.readAsLinesSync().asMap()};
  }

  void addTodo({required String text}) {
    storage.writeAsStringSync(text + "\n", mode: FileMode.append);
  }

  void removeTodo({required int id}) {
    todos.remove(id);
    refreshTodosInStorage();
  }

  void updateTodo({required int id, required String newTitle}) {
    todos = todos.map((key, value) =>
        key == id ? MapEntry(key, newTitle) : MapEntry(key, value));
    refreshTodosInStorage();
  }

  String findTodo({required int id}) {
    return todos[id];
  }

  void refreshTodosInStorage() {
    storage.writeAsStringSync("");
    todos.forEach((key, value) =>
        storage.writeAsStringSync(value + "\n", mode: FileMode.append));
  }
}
