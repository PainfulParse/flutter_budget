import 'package:centsability/domain/entities/transaction.dart';
import 'package:centsability/domain/entities/category.dart';

abstract class Repository {
    Future<List<Transaction>> getAllTransactions();
    Future<List<Category>> getAllCategories();
    Future<void> insertTransaction(Transaction transaction);
    Future<void> updateTransaction(Transaction transaction);
    Future<void> deleteTransaction(Transaction transaction);
    Future<void> insertCategory(Category category);
}