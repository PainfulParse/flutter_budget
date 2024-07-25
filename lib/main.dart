import 'package:centsability/data/repositories/hive_repository.dart';
import 'package:centsability/presentation/viewmodels/main_view_model.dart';
import 'package:centsability/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'data/models/transaction.dart';
import 'data/models/budget_category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());

  final transactionBox = await Hive.openBox<TransactionModel>('transactions');
  final categoryBox = await Hive.openBox<BudgetCategoryModel>('categories');

  final repository = HiveRepository(transactionBox, categoryBox);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainViewModel(repository),
          child: MyApp(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CentsAbility',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
