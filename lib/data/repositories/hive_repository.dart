import 'package:centsability/domain/repositories/repository.dart';
import 'package:centsability/domain/entities/transaction.dart';
import 'package:centsability/domain/entities/budget_category.dart';
import 'package:centsability/data/models/transaction.dart';
import 'package:centsability/data/models/budget_category.dart';
import 'package:hive/hive.dart';

class HiveRepository implements Repository {
  final Box<TransactionModel> transactionBox;
  final Box<BudgetCategoryModel> categoryBox;

  HiveRepository(this.transactionBox, this.categoryBox);

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final transactions = transactionBox.values.toList();
    return transactions.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<BudgetCategory>> getAllCategories() async {
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
  Future<void> insertCategory(BudgetCategory category) async {
    await categoryBox.add(BudgetCategoryModel.fromEntity(category));
  }
}
