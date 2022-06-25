import 'dart:io';
import 'package:todo/todo_manager.dart';
import 'package:todo/command_manager.dart';
import 'package:todo/command_handler.dart';

void main(List<String> arguments) {
  TodoManager todoManager = TodoManager(storage: File("./todo.txt"));

  CommandManager commandManager = CommandManager(command: arguments.asMap());

  CommandHandler commandHandler =
      CommandHandler(todoManager: todoManager, commandManager: commandManager);
  commandHandler.handler();
}
