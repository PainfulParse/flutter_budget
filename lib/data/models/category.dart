import 'package:hive/hive.dart';
import '../../domain/entities/category.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
    @HiveField(0)
    String name;

    CategoryModel({
        required this.name,
    });

    Category toEntity() {
        return Category(
            name: name,
        );
    }

    static CategoryModel fromEntity(Category category) {
        return CategoryModel(
            name: category.name,
        );
    }
}