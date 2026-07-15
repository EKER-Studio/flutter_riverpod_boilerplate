import 'package:isar_community/isar.dart';

part 'category_model.g.dart';

/// Persistent representation of a [Category] domain entity.
@collection
class CategoryModel {
  Id id = Isar.autoIncrement;

  late String name;

  /// ARGB hex color string.
  late String colorHex;
}
