import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/todo.dart';
import 'todo_repository_provider.dart';

part 'todo_notifier.g.dart';

/// Notifier for managing the list of todo items.
@riverpod
class TodoList extends _$TodoList {
  @override
  Stream<List<Todo>> build() {
    final repository = ref.watch(todoRepositoryProvider);
    return repository.watchAll();
  }

  /// Adds a new todo item.
  Future<void> addTodo(String title) async {
    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      return;
    }
    await ref.read(todoRepositoryProvider).add(title: trimmedTitle);
  }

  /// Toggles the completion status of a todo item.
  Future<void> toggleTodo(int id) async {
    await ref.read(todoRepositoryProvider).toggleCompleted(id: id);
  }

  /// Deletes a todo item.
  Future<void> deleteTodo(int id) async {
    await ref.read(todoRepositoryProvider).delete(id: id);
  }
}
