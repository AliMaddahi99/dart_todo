class CommandManager {
  Map<int, String> command;

  CommandManager({required this.command});

  String getCommand(int key) {
    return command[key] ?? "";
  }

  bool isCommandExists(int key, {required String Function() message}) {
    if (command[key] != null) {
      return true;
    }

    print(message());
    printHelper();
    return false;
  }

  void printHelper() {
    print("""
Todo App Commands:
  --add,    -a    [title] : string                       "add a text to todo list"
  --find,   -f    [id]    : int                          "find a todo and return the text"
  --update, -u    [id]    : int     [title] : string     "update a todo"
  --delete, -d    [id]    : int                          "delete a todo"
  --list,   -l                                           "show todos list"
  --help,   -h                                           "show commands list"
""");
  }
}
