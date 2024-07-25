import 'package:hive/hive.dart';
import '../../domain/entities/budget_category.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class BudgetCategoryModel extends HiveObject {
  @HiveField(0)
  String name;

  BudgetCategoryModel({
    required this.name,
  });

  BudgetCategory toEntity() {
    return BudgetCategory(
      name: name,
    );
  }

  static BudgetCategoryModel fromEntity(BudgetCategory category) {
    return BudgetCategoryModel(
      name: category.name,
    );
  }
}
