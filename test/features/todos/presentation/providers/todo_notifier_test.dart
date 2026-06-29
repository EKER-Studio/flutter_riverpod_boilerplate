import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_riverpod_boilerplate/features/todos/domain/entities/todo.dart';
import 'package:flutter_riverpod_boilerplate/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_riverpod_boilerplate/features/todos/presentation/providers/todo_notifier.dart';
import 'package:flutter_riverpod_boilerplate/features/todos/presentation/providers/todo_repository_provider.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

const _tId = 1;
final _tCreatedAt = DateTime(2024, 1, 1);
final _tTodo = Todo(
  id: _tId,
  title: 'Test Todo',
  isCompleted: false,
  createdAt: _tCreatedAt,
);
final _tTodos = [_tTodo];

ProviderContainer _makeContainer(MockTodoRepository mock) {
  return ProviderContainer(
    overrides: [todoRepositoryProvider.overrideWithValue(mock)],
  );
}

void main() {
  late MockTodoRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockTodoRepository();
  });

  tearDown(() {
    container.dispose();
  });

  group('TodoList Notifier - build()', () {
    test('returns list from the first stream event', () async {
      when(() => mockRepo.watchAll()).thenAnswer((_) => Stream.value(_tTodos));

      container = _makeContainer(mockRepo);

      final result = await container.read(todoListProvider.future);

      expect(result, _tTodos);
      verify(() => mockRepo.watchAll()).called(1);
      verifyNever(() => mockRepo.getAll());
    });

    test('state becomes AsyncData on every new stream event', () async {
      final controller = StreamController<List<Todo>>();
      when(() => mockRepo.watchAll()).thenAnswer((_) => controller.stream);

      container = _makeContainer(mockRepo);

      final updatedTodo = _tTodo.copyWith(title: 'Updated');
      controller.add(_tTodos);
      await container.read(todoListProvider.future);

      controller.add([updatedTodo]);
      await Future.microtask(() {});

      final state = container.read(todoListProvider);
      expect(state, isA<AsyncData<List<Todo>>>());
      expect(state.value, [updatedTodo]);

      await controller.close();
    });
  });
}
