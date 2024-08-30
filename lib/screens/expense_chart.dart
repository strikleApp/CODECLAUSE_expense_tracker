import 'package:expense_tracker/modals/expense.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseChart extends StatefulWidget {
  final List<Expense> expenses;

  const ExpenseChart({super.key, required this.expenses});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  final Map<String, Color> _categoryColors = {
    'Food': Colors.red,
    'Transportation': Colors.green,
    'Entertainment': Colors.teal,
    'Miscellaneous': Colors.purple,
  };
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1.3,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: _getChartData(widget.expenses),
                ),
              ),
            ),
          ),
        ),
        ...List.generate(_categoryColors.length, (index) {
          return Indicators(
              text: _categoryColors.keys.toList()[index],
              color: _categoryColors[_categoryColors.keys.toList()[index]]!);
        }),
      ],
    );
  }

  List<PieChartSectionData> _getChartData(List<Expense> expenses) {
    final Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      if (!categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] = 0;
      }
      categoryTotals[expense.category] =
          categoryTotals[expense.category]! + expense.amount;
    }

    return List.generate(categoryTotals.length, (index) {
      final entry = categoryTotals.entries.elementAt(index);
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: _categoryColors[entry.key],
        value: entry.value,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class Indicators extends StatelessWidget {
  final String text;
  final Color color;

  const Indicators({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 15,
          width: 15,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    );
  }
}
