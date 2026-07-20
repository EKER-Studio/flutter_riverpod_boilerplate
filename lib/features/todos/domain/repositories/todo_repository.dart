import '../../../../core/errors/failure.dart';
import '../entities/todo.dart';

/// Repository interface for managing todo items.
abstract class TodoRepository {
  /// Watches all todo items.
  Stream<List<Todo>> watchAll();

  /// Watches a specific todo item by its ID.
  Stream<Todo?> watchById(int id);

  /// Gets all todo items.
  Future<List<Todo>> getAll();

  /// Adds a new todo item with the given title.
  Future<(bool success, Failure? failure)> add({required String title});

  /// Toggles the completion status of a todo item.
  Future<(bool success, Failure? failure)> toggleCompleted({required int id});

  /// Deletes a todo item by its ID.
  Future<(bool success, Failure? failure)> delete({required int id});
}
