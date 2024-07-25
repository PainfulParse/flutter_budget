import 'package:centsability/domain/entities/transaction.dart';
import 'package:centsability/domain/entities/budget_category.dart';

abstract class Repository {
  Future<List<Transaction>> getAllTransactions();
  Future<List<BudgetCategory>> getAllCategories();
  Future<void> insertTransaction(Transaction transaction);
  Future<void> updateTransaction(Transaction transaction);
  Future<void> deleteTransaction(Transaction transaction);
  Future<void> insertCategory(BudgetCategory category);
}
