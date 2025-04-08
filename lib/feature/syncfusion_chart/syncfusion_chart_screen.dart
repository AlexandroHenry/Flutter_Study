import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionChartScreen extends StatelessWidget {
  const SyncfusionChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Charts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Syncfusion Flutter Charts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Chart example
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Line Chart Example',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 300,
                      color: const Color.fromARGB(255, 255, 77, 0).withOpacity(0.1),
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0, // Set to 0 to remove chart border
                        primaryXAxis: CategoryAxis(
                          axisLine: const AxisLine(width: 0),
                          majorGridLines: const MajorGridLines(width: 0),
                          majorTickLines: const MajorTickLines(size: 0),
                          labelStyle: const TextStyle(color: Colors.black), // Text color must be transparent to hide axis
                          isVisible: false, // Hide chart x-axis
                        ),
                        primaryYAxis: NumericAxis(
                          numberFormat: NumberFormat.compact(), // Compact number format e.g. 50000 -> 50k
                          axisLine: const AxisLine(width: 0),
                          majorGridLines: const MajorGridLines(width: 0),
                          majorTickLines: const MajorTickLines(size: 0),
                          labelStyle: const TextStyle(color: Colors.transparent),
                          isVisible: false, // Hide chart y-axis
                        ),
                        title: ChartTitle(text: 'Monthly Sales'),
                        series: <CartesianSeries>[
                          LineSeries<SalesData, String>(
                            dataSource: getSalesData(),
                            xValueMapper: (SalesData data, _) => data.month,
                            yValueMapper: (SalesData data, _) => data.sales,
                            name: 'Sales', // Title in tooltip
                            dataLabelSettings: const DataLabelSettings(isVisible: true), // Show values at each point
                            markerSettings: const MarkerSettings(isVisible: true), // Show dots on line
                          )
                        ],
                        tooltipBehavior: TooltipBehavior(enable: true), // Enable tooltip on tap
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Column Chart Example',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 300,
                      color: Colors.green.withOpacity(0.1),
                      // child: SfCartesianChart(
                      //   primaryXAxis: const CategoryAxis(),
                      //   title: const ChartTitle(text: 'Quarterly Product Sales'),
                      //   series: <CartesianSeries>[
                      //     ColumnSeries<ProductData, String>(
                      //       dataSource: getProductData(),
                      //       xValueMapper: (ProductData data, _) => data.quarter,
                      //       yValueMapper: (ProductData data, _) => data.amount,
                      //       name: 'Sales',
                      //       borderRadius: BorderRadius.circular(5),
                      //       dataLabelSettings: const DataLabelSettings(isVisible: true),
                      //     )
                      //   ],
                      //   tooltipBehavior: TooltipBehavior(enable: true),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Pie Chart Example',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 300,
                      color: Colors.red.withOpacity(0.1),
                      // child: SfCircularChart(
                      //   title: const ChartTitle(text: 'Regional Sales Market Share'),
                      //   legend: const Legend(isVisible: true),
                      //   series: <CircularSeries>[
                      //     PieSeries<RegionData, String>(
                      //       dataSource: getRegionData(),
                      //       xValueMapper: (RegionData data, _) => data.region,
                      //       yValueMapper: (RegionData data, _) => data.percentage,
                      //       dataLabelSettings: const DataLabelSettings(isVisible: true),
                      //       explode: true,
                      //       explodeIndex: 0,
                      //     )
                      //   ],
                      //   tooltipBehavior: TooltipBehavior(enable: true),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Additional information
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Syncfusion Flutter Charts Usage Notes:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text("1. Check package version compatibility."),
                    Text("2. withValues method issues can be resolved with extension methods."),
                    Text("3. Behavior may differ between mobile and web."),
                    Text("4. Pay attention to memory usage."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Monthly sales data
  List<SalesData> getSalesData() {
    return [
      SalesData('Jan', 35000),
      SalesData('Feb', 28000),
      SalesData('Mar', 34000),
      SalesData('Apr', 32000),
      SalesData('May', 40000),
      SalesData('Jun', 45000),
      SalesData('Jul', 48000),
    ];
  }

  // Quarterly product sales data
  List<ProductData> getProductData() {
    return [
      ProductData('Q1', 120),
      ProductData('Q2', 150),
      ProductData('Q3', 85),
      ProductData('Q4', 190),
    ];
  }

  // Regional sales market share data
  List<RegionData> getRegionData() {
    return [
      RegionData('Seoul', 30),
      RegionData('Busan', 18),
      RegionData('Daegu', 12),
      RegionData('Incheon', 15),
      RegionData('Others', 25),
    ];
  }
}

// Monthly sales data model
class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}

// Quarterly product sales data model
class ProductData {
  final String quarter;
  final double amount;

  ProductData(this.quarter, this.amount);
}

// Regional sales market share data model
class RegionData {
  final String region;
  final double percentage;

  RegionData(this.region, this.percentage);
}
