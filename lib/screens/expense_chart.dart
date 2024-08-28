import 'package:expense_tracker/modals/expense.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final expensesProvider = Provider.of<ExpensesProvider>(context);

    final data = _getChartData(expensesProvider.expenses);

    return PieChart(
      PieChartData(
        sections: data.map((expense) {
          return PieChartSectionData(
            value: expense.amount,
            title: '${expense.category}: \$${expense.amount}',
            color: Colors.blue, // You can customize the color here
          );
        }).toList(),
      ),
    );
  }

  List<Expense> _getChartData(List<Expense> expenses) {
    final Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      if (!categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] = 0;
      }
      categoryTotals[expense.category] =
          categoryTotals[expense.category]! + expense.amount;
    }

    return categoryTotals.entries
        .map((entry) => Expense(
              title: entry.key,
              amount: entry.value,
              date: DateTime.now(),
              category: entry.key,
            ))
        .toList();
  }
}
