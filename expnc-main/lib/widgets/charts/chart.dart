import 'package:flutter/material.dart';
import 'package:expnc/widgets/charts/chart_bar.dart';
// import 'package:expnc/widgets/chart/chart_bar.dart';
import 'package:expnc/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forEachCategory(expenses, Category.food),
      ExpenseBucket.forEachCategory(expenses, Category.leisure),
      ExpenseBucket.forEachCategory(expenses, Category.travel),
      ExpenseBucket.forEachCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        CategoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
  


// class Chart extends StatelessWidget {
//   const Chart({super.key, required this.expenses});

//   final List<Expense> expenses;

//   List<ExpenseBucket> get buckets {
//     return [
//       ExpenseBucket.forEachCategory(expenses, Category.food),
//       ExpenseBucket.forEachCategory(expenses, Category.leisure),
//       ExpenseBucket.forEachCategory(expenses, Category.travel),
//       ExpenseBucket.forEachCategory(expenses, Category.work),
//     ];
//   }

//   double get maxTotalExpense {
//     double maxTotalExpense = 0;

//     for (final bucket in buckets) {
//       if (bucket.totalExpenses > maxTotalExpense) {
//         maxTotalExpense = bucket.totalExpenses;
//       }
//     }

//     return maxTotalExpense;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode =
//         MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.symmetric(
//           vertical: 16,
//           horizontal: 8,
//         ),
//         width: double.infinity,
//         height: 220, // Increased for better layout of text + bars
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.primary.withOpacity(0.4),
//               Theme.of(context).colorScheme.primary.withOpacity(0.1)
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).shadowColor.withOpacity(0.2),
//               blurRadius: 8,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   for (final bucket in buckets)
//                     ChartBar(
//                       fill: bucket.totalExpenses == 0
//                           ? 0
//                           : bucket.totalExpenses / maxTotalExpense,
//                       amount: bucket.totalExpenses, // Pass total expenses
//                       label: bucket.category.name, // Pass category name
//                     ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: buckets
//                   .map(
//                     (bucket) => Expanded(
//                       child: Column(
//                         children: [
//                           Icon(
//                             CategoryIcons[bucket.category],
//                             color: isDarkMode
//                                 ? Theme.of(context).colorScheme.secondary
//                                 : Theme.of(context)
//                                     .colorScheme
//                                     .primary
//                                     .withOpacity(0.7),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             bucket.category.name,
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
