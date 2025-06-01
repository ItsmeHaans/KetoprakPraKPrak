import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//import biasa


void main() {
  runApp(const SmartCityDashboard());
}//fungsi main buat manggil SmartCityDashboard

class SmartCityDashboard extends StatelessWidget {
  const SmartCityDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}


//Ini bagian yang membagi menjadi 3 panel kalau mau diubah menjadi 2 atau 4 nanti ubahnya disininya
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            child: EnergyWidget(),
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: WeatherForecastPanel(),
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: AutomationPanel(),
          ),
        ],
      ),
    );
  }
}


//Ini bagian kiri

class EnergyWidget extends StatelessWidget {
  const EnergyWidget({super.key});

  // Dummy data
  List<FlSpot> getPredictedTrend() => [
        FlSpot(0, 55.0),
        FlSpot(1, 54.5),
        FlSpot(2, 54.0),
        FlSpot(3, 53.8),
        FlSpot(4, 53.5),
        FlSpot(5, 52.0),
      ];

  List<FlSpot> getInputTrend() => [
        FlSpot(0, 3.2),
        FlSpot(1, 3.5),
        FlSpot(2, 3.6),
        FlSpot(3, 3.4),
        FlSpot(4, 3.3),
        FlSpot(5, 3.1),
      ];

  List<FlSpot> getOutputTrend() => [
        FlSpot(0, 1.7),
        FlSpot(1, 1.9),
        FlSpot(2, 2.0),
        FlSpot(3, 2.1),
        FlSpot(4, 2.2),
        FlSpot(5, 2.3),
      ];

  @override
  Widget build(BuildContext context) {
    final energyTrend = getPredictedTrend();
    final inputTrend = getInputTrend();
    final outputTrend = getOutputTrend();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lightning_wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.wb_sunny, size: 40),
                SizedBox(width: 10),
                Text('Wed\n28°C', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double boxWidth = constraints.maxWidth / 2;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('INPUT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            width: boxWidth,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('+3.2 kwh', style: TextStyle(color: Colors.green, fontSize: 20), textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('OUTPUT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            width: boxWidth,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('-1.7 kwh', style: TextStyle(color: Colors.red, fontSize: 20), textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            const Text('CURRENT ( input-output )', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            const Text('+1.5 kwh', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const Text('SAVED ENERGY', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            const Text('+55.0 kwh', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const Text('EXPECTED SAVED ENERGY TODAY', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            const Text('+62.2 kwh', style: TextStyle(color: Color.fromARGB(255, 156, 211, 158), fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.62,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 156, 211, 158),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('Energy Trend (kWh)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: 60,
                  titlesData: FlTitlesData(
                    // BAGIAN YANG DIUBAH - MULAI
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          final hours = ['04.00', '08.00', '12.00', '16.00', '20.00', '24.00'];
                          return value.toInt() < hours.length 
                              ? Text(hours[value.toInt()])
                              : const Text('');
                        },
                        reservedSize: 30,
                      ),
                    ),
                    // BAGIAN YANG DIUBAH - SELESAI
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (value, _) => Text('${value.toInt()}'),
                        reservedSize: 30,
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: energyTrend,
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.orangeAccent,
                      dotData: FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: inputTrend,
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.green,
                      dotData: FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: outputTrend,
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.redAccent,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LegendItem(color: Colors.orangeAccent, label: 'Predicted Saved'),
                LegendItem(color: Colors.green, label: 'Input'),
                LegendItem(color: Colors.redAccent, label: 'Output'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk legend (tambahan)
class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}



//Ini bagian mid nya
class WeatherForecastPanel extends StatelessWidget {
  const WeatherForecastPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'WEATHER FORECAST',
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 35),
          // Icon Cuaca per Hari
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Jakarta Today',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                  ),
                    Text(
                    '28°C',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    SizedBox(width: 6),
                      Text(
                        'Sunny',
                        style: TextStyle(
                          fontSize: 18,
                            color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 35),
          const Divider(color: Colors.white),
          const SizedBox(height: 20),
          // Ini buat predicted Input/Output/Saved per Hari
          const ForecastCarousel(),
        ],
      ),
    );
  }
}

class ForecastTriple extends StatelessWidget {
  final String input;
  final String output;
  final String saved;

  const ForecastTriple({
    super.key,
    required this.input,
    required this.output,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          ForecastData(
            title: 'PREDICTED INPUT', 
            value: input, 
            titleColor: Colors.white,
            valueColor: Colors.green
          ),
          const SizedBox(height: 15),
          ForecastData(
            title: 'PREDICTED OUTPUT', 
            value: output, 
            titleColor: Colors.white,
            valueColor: Colors.red
          ),
          const SizedBox(height: 15),
          ForecastData(
            title: 'PREDICTED SAVED ENERGY', 
            value: saved, 
            titleColor: Colors.white,
            valueColor: Colors.green
          ),
        ],
      ),
    );
  }
}

class ForecastCarousel extends StatefulWidget {
  const ForecastCarousel({super.key});
  @override
  _ForecastCarouselState createState() => _ForecastCarouselState();
}

class _ForecastCarouselState extends State<ForecastCarousel> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> forecasts = [
    {
      'icon': Icons.cloud,
      'day': 'Thu',
      'temp': '22°C',
      'input': '+1.6 kWh',
      'output': '-1.8 kWh',
      'saved': '+38.6 kWh',
      'graph': [
        {'label': 'Input', 'data': [1.6, 1.8, 1.7, 1.9, 2.0, 1.8, 1.6]},
        {'label': 'Output', 'data': [1.8, 1.6, 1.9, 2.0, 1.7, 1.5, 1.8]},
        {'label': 'Saved', 'data': [38.6, 39.0, 39.5, 40.0, 40.5, 41.0, 41.5]},
      ],
    },
    {
      'icon': Icons.thunderstorm,
      'day': 'Fri',
      'temp': '20°C',
      'input': '+1.2 kWh',
      'output': '-2.0 kWh',
      'saved': '+36.0 kWh',
      'graph': [
        {'label': 'Input', 'data': [1.2, 1.4, 1.3, 1.5, 1.6, 1.4, 1.2]},
        {'label': 'Output', 'data': [2.0, 1.8, 2.1, 2.2, 1.9, 1.7, 2.0]},
        {'label': 'Saved', 'data': [36.0, 36.5, 37.0, 37.5, 38.0, 38.5, 39.0]},
      ],
    },
    {
      'icon': Icons.wb_sunny,
      'day': 'Sat',
      'temp': '25°C',
      'input': '+1.8 kWh',
      'output': '-1.5 kWh',
      'saved': '+40.2 kWh',
      'graph': [
        {'label': 'Input', 'data': [1.8, 2.0, 1.9, 2.1, 2.2, 2.0, 1.8]},
        {'label': 'Output', 'data': [1.5, 1.3, 1.6, 1.7, 1.4, 1.2, 1.5]},
        {'label': 'Saved', 'data': [40.2, 40.7, 41.2, 41.7, 42.2, 42.7, 43.2]},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final forecast = forecasts[currentIndex];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left, color: Colors.white, size: 32),
              onPressed: currentIndex > 0
                  ? () => setState(() => currentIndex--)
                  : null,
            ),
            ForecastDay(
              icon: forecast['icon'],
              day: forecast['day'],
              temp: forecast['temp'],
            ),
            IconButton(
              icon: const Icon(Icons.arrow_right, color: Colors.white, size: 32),
              onPressed: currentIndex < forecasts.length - 1
                  ? () => setState(() => currentIndex++)
                  : null,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ForecastTriple(
          input: forecast['input'],
          output: forecast['output'],
          saved: forecast['saved'],
        ),
        const SizedBox(height: 20),
        ForecastGraph(data: forecast['graph'])
      ],
    );
  }
}

class ForecastGraph extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const ForecastGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Convert negative output values to positive
    final positiveData = data.map((dataset) {
      if (dataset['label'] == 'Output') {
        return {
          'label': dataset['label'],
          'data': (dataset['data'] as List<double>).map((value) => value.abs()).toList()
        };
      }
      return dataset;
    }).toList();

    // Ambil semua nilai Y dari ketiga dataset
    final allYValues = positiveData.expand((d) => d['data'] as List<double>).toList();
    final minY = 0.0;
    final maxY = allYValues.reduce((a, b) => a > b ? a : b);
    
    // Buat interval yang lebih bulat (kelipatan 10)
    double roundedMaxY = (maxY / 10).ceil() * 10.0;
    // Pastikan roundedMaxY tidak sama dengan maxY untuk memberi ruang kosong di atas
    if (roundedMaxY <= maxY) {
      roundedMaxY += 10.0;
    }

    // Define line colors - green, red, white
    final lineColors = [
      Colors.green,
      Colors.red,
      Colors.white,
    ];

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 10, // Interval tetap 10 untuk kelipatan bulat
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 42,
                interval: 10, // Interval label setiap 10 unit
                getTitlesWidget: (value, meta) {
                  // Jangan tampilkan label untuk nilai tertinggi (roundedMaxY)
                  if (value == roundedMaxY) return const SizedBox();
                  return Text(
                    value.toInt() == value ? '${value.toInt()}' : '${value.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final days = ['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7'];
                  return value.toInt() < days.length 
                      ? Text(
                          days[value.toInt()],
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        )
                      : const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white24),
          ),
          minX: 0,
          maxX: (positiveData[0]['data'] as List).length - 1.toDouble(),
          minY: minY,
          maxY: roundedMaxY,
          lineBarsData: List.generate(positiveData.length, (i) {
            final d = positiveData[i];
            return LineChartBarData(
              spots: (d['data'] as List<double>)
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              isCurved: true,
              color: lineColors[i % lineColors.length],
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            );
          }),
        ),
      ),
    );
  }
}

class ForecastDay extends StatelessWidget {
  final IconData icon;
  final String day;
  final String temp;

  const ForecastDay({
    super.key,
    required this.icon,
    required this.day,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40),
        const SizedBox(height: 4),
        Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          temp,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ForecastData extends StatelessWidget {
  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;

  const ForecastData({
    super.key,
    required this.title,
    required this.value,
    required this.titleColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}



class AutomationPanel extends StatelessWidget {
  const AutomationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final double savedEnergy = 45.0; // Example backend value for Saved Energy
    final bool isAutoOn = savedEnergy >= 50.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lightning_wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'AUTOMATION STATUS',
            style: TextStyle(
              fontSize: 22, 
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
              children: [
                TextSpan(text: 'Power saving mode starts when predicted saved energy is lower than '),
                TextSpan(
                  text: '+50.0 kwh',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            isAutoOn
                ? 'All devices are operating optimally.'
                : '⚠️ Turn off Air Conditioner, Water Pump, and Lighting System to save energy.',
            style: TextStyle(
              color: isAutoOn ? Colors.green : Colors.redAccent,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // New box for current mode
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Current Mode: Power Saving',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          // One big rectangle wrapping all device rows
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: const [
                AutomationDeviceRow(deviceName: 'Air Conditioner', isOn: true),
                Divider(color: Colors.black, thickness: 1),
                AutomationDeviceRow(deviceName: 'Water Pump', isOn: true),
                Divider(color: Colors.black, thickness: 1),
                AutomationDeviceRow(deviceName: 'Lighting System', isOn: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AutomationDeviceRow extends StatelessWidget {
  final String deviceName;
  final bool isOn;

  const AutomationDeviceRow({
    super.key,
    required this.deviceName,
    required this.isOn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            deviceName,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationThickness: 2.0,
              fontSize: 18,
            ),
          ),
          Switch(
            value: isOn,
            onChanged: null, // disabled because this is automatic
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red[200],
          ),
        ],
      ),
    );
  }
}

class AutomationDeviceStatus extends StatelessWidget {
  final String deviceName;
  final bool isOn;

  const AutomationDeviceStatus({super.key, required this.deviceName, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              deviceName,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 2.0,
                fontSize: 18,
              ),
            ),
            Switch(
              value: isOn,
              onChanged: null, // disabled because this is automatic
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red[200],
            ),
          ],
        ),
      ),
    );
  }
}

