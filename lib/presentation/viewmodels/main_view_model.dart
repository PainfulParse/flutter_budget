import 'package:flutter/foundation.dart';
import 'package:centsability/domain/entities/budget_category.dart';
import 'package:centsability/domain/entities/transaction.dart';
import '../../domain/repositories/repository.dart';

class MainViewModel extends ChangeNotifier {
  final Repository repository;

  MainViewModel(this.repository);

  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  List<BudgetCategory> _categories = [];
  List<BudgetCategory> get categories => _categories;

  Future<void> fetchTransactions() async {
    _transactions = await repository.getAllTransactions();
  }

  Future<void> fetchCategories() async {
    _categories = await repository.getAllCategories();
    notifyListeners();
  }

  Future<void> addTransaction(Transaction transaction) async {
    await repository.insertTransaction(transaction);
    fetchTransactions();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await repository.updateTransaction(transaction);
    fetchTransactions();
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await repository.deleteTransaction(transaction);
    fetchTransactions();
  }

  Future<void> addCategory(BudgetCategory category) async {
    await repository.insertCategory(category);
    fetchCategories();
  }
}
