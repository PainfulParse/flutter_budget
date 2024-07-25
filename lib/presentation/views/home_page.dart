import 'package:centsability/presentation/viewmodels/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double runningBalance = 0.0;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<MainViewModel>(context, listen: false);
    viewModel.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);
    runningBalance = 0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CentsAbility"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: viewModel.transactions.length,
          itemBuilder: (context, index) {
            final transaction = viewModel.transactions[index];
            runningBalance += transaction.amount;
            return ListTile(
              title: Text(transaction.name),
              subtitle: Text('${transaction.date.toLocal()}'.split(' ')[0]),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$${transaction.amount.toStringAsFixed(2)}'),
                  Text('Balance: \$${runningBalance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: runningBalance >= 0 ? Colors.green : Colors.red,
                      ))
                ],
              ),
            );
          }),
    );
  }
}
