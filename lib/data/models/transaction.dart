import 'package:hive/hive.dart';
import '../../domain/entities/transaction.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
    @HiveField(0)
    String name;

    @HiveField(1)
    double amount;

    @HiveField(2)
    DateTime date;

    @HiveField(3)
    int categoryId;

    TransactionModel({
        required this.name,
        required this.amount,
        required this.date,
        required this.categoryId,
    });

    Transaction toEntity() {
        return Transaction(
            name: name,
            amount: amount,
            date: date,
            categoryId: categoryId,
        );
    }

    static TransactionModel fromEntity(Transaction transaction) {
        return TransactionModel(
            name: transaction.name,
            amount: transaction.amount,
            date: transaction.date,
            categoryId: transaction.categoryId,
        );
    }
}