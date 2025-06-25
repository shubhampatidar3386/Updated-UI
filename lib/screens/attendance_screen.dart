import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool showEarnings = true;
  bool showPayments = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance & Earnings Overview", style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {}),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Center(child: Text("14-05-2025", style: TextStyle(color: Colors.teal))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TabSelector(),
            const DateRangePickerWidget(),
            const EarningsSummaryCards(),
            const AttendanceProgress(),
            const AttendanceLineChart(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip(
                    label: const Text("Earnings"),
                    selected: showEarnings,
                    onSelected: (val) => setState(() => showEarnings = val),
                    selectedColor: Colors.green.shade200,
                  ),
                  const SizedBox(width: 12),
                  FilterChip(
                    label: const Text("Payments"),
                    selected: showPayments,
                    onSelected: (val) => setState(() => showPayments = val),
                    selectedColor: Colors.pink.shade200,
                  ),
                ],
              ),
            ),
            EarningsBarChart(showEarnings: showEarnings, showPayments: showPayments),
            const SizedBox(height: 12),
            WorkerListSection(), // removed const for stateful
          ],
        ),
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  const TabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        // Icon(Icons.person_outline, color: Colors.grey),
        // SizedBox(width: 30),
        Icon(Icons.calendar_month, color: Colors.blue),
        SizedBox(width: 30),
      //   Icon(Icons.location_on_outlined, color: Colors.grey),
      ],
    );
  }
}
class DateRangePickerWidget extends StatefulWidget {
  const DateRangePickerWidget({super.key});

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? selectedRange;

  @override
  void initState() {
    super.initState();
    selectedRange = DateTimeRange(
      start: DateTime(2025, 5, 11),
      end: DateTime(2025, 5, 15),
    );
  }

  String get formattedRange {
    if (selectedRange == null) return "Select date range";
    final start = "${selectedRange!.start.day} ${_monthName(selectedRange!.start.month)} ${selectedRange!.start.year}";
    final end = "${selectedRange!.end.day} ${_monthName(selectedRange!.end.month)} ${selectedRange!.end.year}";
    return "$start - $end";
  }

  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  void _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
      initialDateRange: selectedRange,
    );

    if (picked != null) {
      setState(() {
        selectedRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: _pickDateRange,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 10),
              Text(
                formattedRange,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EarningsSummaryCards extends StatelessWidget {
  const EarningsSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SummaryCard(title: "Daily Earn", value: "₹14,500", color: Colors.blue.shade100),
        SummaryCard(title: "Total Earn", value: "₹65,000", color: Colors.green.shade100),
        SummaryCard(title: "Total Spend", value: "₹35,000", color: Colors.red.shade100),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Icon(Icons.currency_rupee),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class AttendanceProgress extends StatelessWidget {
  const AttendanceProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Attendance", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(
                child: LinearProgressIndicator(value: 1, color: Colors.black, backgroundColor: Colors.grey),
              ),
              SizedBox(width: 10),
              Text("100%"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Row(children: [Icon(Icons.check, color: Colors.green), Text(" 5")]),
              Row(children: [Icon(Icons.close, color: Colors.red), Text(" 0")]),
              Text("Total: 5"),
            ],
          ),
        ],
      ),
    );
  }
}

class AttendanceLineChart extends StatelessWidget {
  const AttendanceLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Attendance Rate',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 25,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade300,
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: Colors.grey.shade300,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 25,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) => Text(
                        '${value.toInt()}%',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, _) {
                        final days = ['May 11', 'May 12', 'May 13', 'May 14', 'May 15'];
                        if (value.toInt() >= 0 && value.toInt() < days.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.lightBlue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: Colors.white,
                        strokeColor: Colors.lightBlue,
                        strokeWidth: 2,
                      ),
                    ),
                    spots: const [
                      FlSpot(0, 100),
                      FlSpot(1, 85),
                      FlSpot(2, 93),
                      FlSpot(3, 97),
                      FlSpot(4, 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle, size: 10, color: Colors.lightBlue),
              SizedBox(width: 4),
              Text(
                'Attendance Rate',
                style: TextStyle(fontSize: 12, color: Colors.lightBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class EarningsBarChart extends StatelessWidget {
  final bool showEarnings;
  final bool showPayments;

  const EarningsBarChart({
    super.key,
    required this.showEarnings,
    required this.showPayments,
  });

  @override
  Widget build(BuildContext context) {
    final barGroups = <BarChartGroupData>[];
    final earnings = [10000, 12000, 16000, 13000, 15000];
    final payments = [9000, 10000, 14000, 12800, 14000];

    for (int i = 0; i < earnings.length; i++) {
      final rods = <BarChartRodData>[];
      if (showEarnings) {
        rods.add(BarChartRodData(toY: earnings[i].toDouble(), color: Colors.green, width: 12));
      }
      if (showPayments) {
        rods.add(BarChartRodData(toY: payments[i].toDouble(), color: Colors.pink, width: 12));
      }
      if (rods.isNotEmpty) {
        barGroups.add(BarChartGroupData(x: i, barRods: rods, barsSpace: 4));
      }
    }

    return Container(
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Earnings & Payments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 17000,
                barGroups: barGroups,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 4000,
                  drawVerticalLine: false,
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, _) => Text('₹${(value ~/ 1000)}k', style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        final day = 11 + value.toInt();
                        return Text("May $day", style: const TextStyle(fontSize: 11));
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class WorkerListSection extends StatefulWidget {
  const WorkerListSection({super.key});

  @override
  State<WorkerListSection> createState() => _WorkerListSectionState();
}

class _WorkerListSectionState extends State<WorkerListSection> {
  final List<Map<String, dynamic>> workers = [
    {"name": "Vijay Kumar", "role": "Foreman", "rate": 8.5, "active": true},
    {"name": "Naresh Singh", "role": "Electrician", "rate": 7.8, "active": true},
    {"name": "Prashant Sharma", "role": "Plumber", "rate": 8.2, "active": true},
    {"name": "Rahul Desai", "role": "Carpenter", "rate": 7.5, "active": true},
    {"name": "Ankit Mishra", "role": "Painter", "rate": 6.9, "active": true},
    {"name": "Suresh Kumar", "role": "Mason", "rate": 7.9, "active": true},
    {"name": "Raj Patel", "role": "Helper", "rate": 6.5, "active": true},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final worker = workers[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PaymentScreen(worker: worker)),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(worker["name"].split(" ").map((e) => e[0]).take(2).join()),
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(worker["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(worker["role"], style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Icon(worker["active"] ? Icons.check_circle : Icons.cancel,
                    color: worker["active"] ? Colors.green : Colors.red),
                const SizedBox(width: 8),
                Switch(
                  value: worker["active"],
                  onChanged: (val) {
                    setState(() {
                      workers[index]["active"] = val;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Text("${worker["rate"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PaymentScreen extends StatefulWidget {
  final Map<String, dynamic> worker;
  const PaymentScreen({super.key, required this.worker});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String paymentMode = 'Cash';
  DateTime selectedDate = DateTime.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalEarnings = 12000;
    final int paymentsMade = 10000;
    final int remaining = totalEarnings - paymentsMade;
    final int percent = ((paymentsMade / totalEarnings) * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Record Payment"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            title: Text(widget.worker["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(widget.worker["role"]),
            trailing: Text("₹${widget.worker["rate"]}/hr"),
          ),
          const SizedBox(height: 12),

          // Extra Date Picker above Payment Summary
          const Text("Select Date Range", style: TextStyle(fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              child: Text("${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"),
            ),
          ),

          const SizedBox(height: 20),

          // Payment Summary First
          _buildPaymentSummary(totalEarnings, paymentsMade, remaining, percent),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.attach_money, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Record Payment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),

                const SizedBox(height: 20),

                const Text("Amount (₹)", style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Enter amount"),
                ),

                const SizedBox(height: 16),

                const Text("Payment Mode", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRadioButton("Cash"),
                    _buildRadioButton("Bank Transfer"),
                    _buildRadioButton("UPI"),
                  ],
                ),

                const SizedBox(height: 16),

                const Text("Payment Date", style: TextStyle(fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    child: Text("${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"),
                  ),
                ),

                const SizedBox(height: 16),

                const Text("Comment (Optional)", style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  controller: _commentController,
                  maxLines: 2,
                  decoration: const InputDecoration(hintText: "Add a note about this payment"),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text("Record Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Attendance and Earnings Toggle at the bottom
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Attendance"),
                      Tab(text: "Earnings"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      _buildAttendanceTab(),
                      _buildEarningsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: paymentMode,
          onChanged: (val) {
            setState(() {
              paymentMode = val!;
            });
          },
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPaymentSummary(int total, int paid, int remaining, int percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.pie_chart_outline, size: 20),
            SizedBox(width: 8),
            Text("Payment Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(value: total.toDouble(), color: Colors.green, title: 'Total', titleStyle: const TextStyle(color: Colors.white, fontSize: 12)),
                      PieChartSectionData(value: paid.toDouble(), color: Colors.blue, title: '$percent%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12)),
                      PieChartSectionData(value: remaining.toDouble(), color: Colors.red, title: '${100 - percent}%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                    centerSpaceRadius: 35,
                    sectionsSpace: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text("Total Earnings: ₹$total", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("Payments Made: ₹$paid", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("Remaining: ₹$remaining", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  Text("Payment %: $percent%", style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            _Legend(color: Colors.green, label: "Total Earnings"),
            SizedBox(width: 12),
            _Legend(color: Colors.blue, label: "Payments Made"),
            SizedBox(width: 12),
            _Legend(color: Colors.red, label: "Remaining"),
          ],
        ),
      ],
    );
  }

  Widget _buildAttendanceTab() {
    final attendance = {
      "May 13": true,
      "May 12": true,
      "May 11": false,
      "May 10": true,
      "May 9": false,
      "May 8": true,
    };
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: attendance.length,
      itemBuilder: (context, index) {
        final entry = attendance.entries.elementAt(index);
        return Card(
          child: ListTile(
            title: Text(entry.key),
            trailing: Text(
              entry.value ? 'Present' : 'Absent',
              style: TextStyle(
                color: entry.value ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEarningsTab() {
    final List<Map<String, dynamic>> earnings = [
      {"date": "May 13, 2025", "amount": 160},
      {"date": "May 12, 2025", "amount": 150},
      {"date": "May 10, 2025", "amount": 160},
      {"date": "May 09, 2025", "amount": 170},
      {"date": "May 08, 2025", "amount": 165},
    ];

    final int total = earnings.fold<int>(0, (sum, e) => sum + (e["amount"] as int));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text("Total Earnings: ₹$total", style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: earnings.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final entry = earnings[index];
            return ListTile(
              title: Text(entry["date"]),
              trailing: Text("₹${entry["amount"]}", style: const TextStyle(fontWeight: FontWeight.w600)),
            );
          },
        )
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
