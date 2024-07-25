import 'package:centsability/data/repositories/repository.dart';
import 'package:centsability/domain/entities/transaction.dart';
import 'package:centsability/domain/entities/category.dart';
import 'package:centsability/data/models/transaction.dart';
import 'package:centsability/data/models/category.dart';
import 'package:hive/hive.dart';

class HiveRepository extends Repository {
  final Box<TransactionModel> transactionBox;
  final Box<CategoryModel> categoryBox;

  HiveRepository(this.transactionBox, this.categoryBox);

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final transactions = transactionBox.values.toList();
    return transactions.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    final categories = categoryBox.values.toList();
    return categories.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> insertTransaction(Transaction transaction) async {
    await transactionBox.add(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    final model = TransactionModel.fromEntity(transaction);
    await model.save();
  }

  @override
  Future<void> deleteTransaction(Transaction transaction) async {
    final model = TransactionModel.fromEntity(transaction);
    await model.delete();
  }

  @override
  Future<void> insertCategory(Category category) async {
    await categoryBox.add(CategoryModel.fromEntity(category));
  }
}
