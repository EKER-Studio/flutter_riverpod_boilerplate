import '../../domain/entities/category.dart';
import '../models/category_model.dart';

/// Converts [CategoryModel] instances to domain [Category] entities.
extension CategoryModelMapper on CategoryModel {
  Category toEntity() {
    return Category(id: id, name: name, colorHex: colorHex);
  }
}

/// Converts domain [Category] instances to [CategoryModel].
extension CategoryEntityMapper on Category {
  CategoryModel toModel() {
    return CategoryModel()
      ..id = id
      ..name = name
      ..colorHex = colorHex;
  }
}
