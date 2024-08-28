import 'package:expense_tracker/modals/expense.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> loadExpenses() async {
    _expenses = await ExpenseDatabase.instance.fetchExpenses();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await ExpenseDatabase.instance.insertExpense(expense);
    await loadExpenses();
  }

  Future<void> removeExpense(int id) async {
    await ExpenseDatabase.instance.deleteExpense(id);
    await loadExpenses();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesProvider = Provider.of<ExpensesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView.builder(
        itemCount: expensesProvider.expenses.length,
        itemBuilder: (context, index) {
          final expense = expensesProvider.expenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text('${expense.amount} - ${expense.category}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                expensesProvider.removeExpense(expense.id!);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpenseScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Expense',
      ),
    );
  }
}
