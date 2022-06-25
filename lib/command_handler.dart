import 'package:todo/command_manager.dart';
import 'package:todo/todo_manager.dart';

class CommandHandler {
  TodoManager todoManager;
  CommandManager commandManager;

  CommandHandler({required this.todoManager, required this.commandManager});

  void handler() {
    switch (commandManager.getCommand(0)) {
      case "--add":
      case "-a":
        if (!commandManager.isCommandExists(1,
            message: () => "Please enter a title")) {
          break;
        }

        todoManager.addTodo(text: commandManager.getCommand(1));

        // print("(${arguments[1]}) added");
        print("(${commandManager.getCommand(1)}) added");
        break;

      case "--list":
      case "-l":
        todoManager
            .getTodosFromStorage()
            .forEach((key, value) => print("$key : $value"));
        break;

      case "--delete":
      case "-d":
        if (!commandManager.isCommandExists(1,
            message: () => "Please enter an id")) {
          break;
        }

        var id = int.parse(commandManager.getCommand(1));
        todoManager.removeTodo(id: id);

        print("todo $id deleted");
        break;

      case "--update":
      case "-u":
        if (!commandManager.isCommandExists(1,
            message: () => "Please enter an id")) {
          break;
        }

        if (!commandManager.isCommandExists(2,
            message: () => "Please enter new title")) {
          break;
        }

        var id = int.parse(commandManager.getCommand(1));
        var newTitle = commandManager.getCommand(2);

        todoManager.updateTodo(id: id, newTitle: newTitle);

        print("todo $id updated to ($newTitle)");

        break;

      case "--find":
      case "-f":
        if (!commandManager.isCommandExists(1,
            message: () => "Please enter an id")) {
          break;
        }

        var id = int.parse(commandManager.getCommand(1));
        print(todoManager.findTodo(id: id));
        break;

      case "--help":
      case "-h":
        commandManager.printHelper();
        break;

      default:
        commandManager.printHelper();
    }
  }
}
