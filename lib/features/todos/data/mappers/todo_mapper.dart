import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';
import 'category_mapper.dart';

extension TodoModelMapper on TodoModel {
  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
      category: category.value?.toEntity(),
    );
  }
}

extension TodoEntityMapper on Todo {
  TodoModel toModel() {
    return TodoModel()
      ..id = id
      ..title = title
      ..isCompleted = isCompleted
      ..createdAt = createdAt;
  }
}
