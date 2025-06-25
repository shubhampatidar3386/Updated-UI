// // // import 'package:flutter/material.dart';
// // // import 'package:fl_chart/fl_chart.dart';
// // //
// // // class AttendanceEarningsOverview extends StatelessWidget {
// // //   const AttendanceEarningsOverview({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final dailyEarnings = 14500;
// // //     final totalEarnings = 65000;
// // //     final totalSpend = 35000;
// // //     final todayAttendance = 5;
// // //     final totalEmployees = 5;
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Dashboard Overview"),
// // //         centerTitle: true,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           children: [
// // //             GridView.count(
// // //               crossAxisCount: 2,
// // //               childAspectRatio: 1.3,
// // //               mainAxisSpacing: 16,
// // //               crossAxisSpacing: 16,
// // //               physics: const NeverScrollableScrollPhysics(),
// // //               shrinkWrap: true,
// // //               children: [
// // //                 _buildSummaryCard("Daily Earnings", "₹$dailyEarnings", Colors.green),
// // //                 _buildSummaryCard("Total Earnings", "₹$totalEarnings", Colors.blue),
// // //                 _buildSummaryCard("Total Spend", "₹$totalSpend", Colors.red),
// // //                 _buildSummaryCard(
// // //                   "Attendance Today",
// // //                   "$todayAttendance / $totalEmployees",
// // //                   Colors.orange,
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 32),
// // //             const Text("Earnings Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //             const SizedBox(height: 8),
// // //             SizedBox(
// // //               height: 200,
// // //               child: BarChart(
// // //                 BarChartData(
// // //                   alignment: BarChartAlignment.spaceAround,
// // //                   maxY: 20000,
// // //                   barTouchData: BarTouchData(enabled: false),
// // //                   titlesData: FlTitlesData(
// // //                     leftTitles: AxisTitles(
// // //                       sideTitles: SideTitles(showTitles: true, interval: 5000),
// // //                     ),
// // //                     bottomTitles: AxisTitles(
// // //                       sideTitles: SideTitles(
// // //                         showTitles: true,
// // //                         getTitlesWidget: (value, _) {
// // //                           const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
// // //                           return Padding(
// // //                             padding: const EdgeInsets.only(top: 8),
// // //                             child: Text(days[value.toInt() % days.length]),
// // //                           );
// // //                         },
// // //                         interval: 1,
// // //                       ),
// // //                     ),
// // //                     topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //                     rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //                   ),
// // //                   borderData: FlBorderData(show: false),
// // //                   barGroups: [
// // //                     _barGroup(0, 8000),
// // //                     _barGroup(1, 9500),
// // //                     _barGroup(2, 13000),
// // //                     _barGroup(3, 9000),
// // //                     _barGroup(4, 14500),
// // //                     _barGroup(5, 12000),
// // //                     _barGroup(6, 11000),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 32),
// // //             const Text("Payments Breakdown", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //             const SizedBox(height: 8),
// // //             SizedBox(
// // //               height: 200,
// // //               child: PieChart(
// // //                 PieChartData(
// // //                   centerSpaceRadius: 40,
// // //                   sectionsSpace: 2,
// // //                   sections: [
// // //                     PieChartSectionData(
// // //                       color: Colors.green,
// // //                       value: 65000,
// // //                       title: 'Earnings',
// // //                       radius: 60,
// // //                       titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
// // //                     ),
// // //                     PieChartSectionData(
// // //                       color: Colors.red,
// // //                       value: 35000,
// // //                       title: 'Spent',
// // //                       radius: 60,
// // //                       titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildSummaryCard(String title, String value, Color color) {
// // //     return Card(
// // //       elevation: 4,
// // //       color: color.withOpacity(0.1),
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
// // //             const SizedBox(height: 8),
// // //             Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   BarChartGroupData _barGroup(int x, double y) {
// // //     return BarChartGroupData(
// // //       x: x,
// // //       barRods: [
// // //         BarChartRodData(
// // //           toY: y,
// // //           color: Colors.blueAccent,
// // //           width: 16,
// // //           borderRadius: BorderRadius.circular(4),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //
// // class AttendanceEarningsOverview extends StatelessWidget {
// //   const AttendanceEarningsOverview({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final dailyEarnings = 14500;
// //     final totalEarnings = 65000;
// //     final totalSpend = 35000;
// //     final todayAttendance = 5;
// //     final totalEmployees = 5;
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Dashboard Overview"),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             GridView.count(
// //               crossAxisCount: 2,
// //               childAspectRatio: 1.3,
// //               mainAxisSpacing: 16,
// //               crossAxisSpacing: 16,
// //               physics: const NeverScrollableScrollPhysics(),
// //               shrinkWrap: true,
// //               children: [
// //                 _buildSummaryCard("Daily Earnings", "₹$dailyEarnings", Colors.green, FontAwesomeIcons.sackDollar),
// //                 _buildSummaryCard("Total Earnings", "₹$totalEarnings", Colors.blue, FontAwesomeIcons.wallet),
// //                 _buildSummaryCard("Total Spend", "₹$totalSpend", Colors.red, FontAwesomeIcons.moneyBillTrendUp),
// //                 _buildSummaryCard(
// //                   "Attendance Today",
// //                   "$todayAttendance / $totalEmployees",
// //                   Colors.orange,
// //                   FontAwesomeIcons.userCheck,
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 32),
// //             const Text("📊 Earnings Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //             const SizedBox(height: 8),
// //             SizedBox(
// //               height: 200,
// //               child: BarChart(
// //                 BarChartData(
// //                   alignment: BarChartAlignment.spaceAround,
// //                   maxY: 20000,
// //                   barTouchData: BarTouchData(enabled: false),
// //                   titlesData: FlTitlesData(
// //                     leftTitles: AxisTitles(
// //                       sideTitles: SideTitles(showTitles: true, interval: 5000),
// //                     ),
// //                     bottomTitles: AxisTitles(
// //                       sideTitles: SideTitles(
// //                         showTitles: true,
// //                         getTitlesWidget: (value, _) {
// //                           const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
// //                           return Padding(
// //                             padding: const EdgeInsets.only(top: 8),
// //                             child: Text(days[value.toInt() % days.length]),
// //                           );
// //                         },
// //                         interval: 1,
// //                       ),
// //                     ),
// //                     topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //                     rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //                   ),
// //                   borderData: FlBorderData(show: false),
// //                   barGroups: [
// //                     _barGroup(0, 8000),
// //                     _barGroup(1, 9500),
// //                     _barGroup(2, 13000),
// //                     _barGroup(3, 9000),
// //                     _barGroup(4, 14500),
// //                     _barGroup(5, 12000),
// //                     _barGroup(6, 11000),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 32),
// //             const Text("💰 Payments Breakdown", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //             const SizedBox(height: 8),
// //             SizedBox(
// //               height: 200,
// //               child: PieChart(
// //                 PieChartData(
// //                   centerSpaceRadius: 40,
// //                   sectionsSpace: 2,
// //                   sections: [
// //                     PieChartSectionData(
// //                       color: Colors.green,
// //                       value: 65000,
// //                       title: 'Earnings',
// //                       radius: 60,
// //                       titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
// //                     ),
// //                     PieChartSectionData(
// //                       color: Colors.red,
// //                       value: 35000,
// //                       title: 'Spent',
// //                       radius: 60,
// //                       titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildSummaryCard(String title, String value, Color color, IconData icon) {
// //     return Card(
// //       elevation: 4,
// //       color: color.withOpacity(0.1),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(12),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             FaIcon(icon, color: color, size: 32),
// //             const SizedBox(height: 8),
// //             Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
// //             const SizedBox(height: 4),
// //             Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   BarChartGroupData _barGroup(int x, double y) {
// //     return BarChartGroupData(
// //       x: x,
// //       barRods: [
// //         BarChartRodData(
// //           toY: y,
// //           color: Colors.blueAccent,
// //           width: 16,
// //           borderRadius: BorderRadius.circular(4),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
