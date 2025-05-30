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
            child: EnergyStatsPanel(),
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
class EnergyStatsPanel extends StatelessWidget {
  const EnergyStatsPanel({super.key});

  // Tempat nanti input backend nya sambunginnya disini 
  List<FlSpot> getEnergyTrendFromBackend() {
    return [
      FlSpot(0, 50),
      FlSpot(1, 52),
      FlSpot(2, 51),
      FlSpot(3, 53),
      FlSpot(4, 52.6),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final energyTrend = getEnergyTrendFromBackend(); //Ini buat ambil datanya
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.wb_sunny),//Ini buat icon nanti bisa diganti aja
              SizedBox(width: 8),
              Text(
                'Wed\n28°C',//Ini buat tanggal, dan suhu
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //Input dan Output
                Text('INPUT', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('+3.2 kwh', style: TextStyle(color: Colors.green, fontSize: 20)),
                SizedBox(height: 10),
                Text('OUTPUT', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('-1.7 kwh', style: TextStyle(color: Colors.red, fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            //Ini buat currentnya
            'CURRENT ( input-output )',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          const Text(
            '+1.5 kwh',//Ini hasil currentnya
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text('SAVED ENERGY', style: TextStyle(fontWeight: FontWeight.bold)),//Ini saved energynya
          const Text('+55.0 kwh', style: TextStyle(color: Colors.green, fontSize: 20)),//Ini besar saved energynya
          const SizedBox(height: 20),
          const Text(
            'EXPECTED SAVED ENERGY TODAY',
            style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
          ),
          const Text('+52.6 kwh', style: TextStyle(color: Colors.green, fontSize: 20)),
          const SizedBox(height: 20),
          //Ini buat boxnya
          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ======================= START dari GRAFIK DINAMIS =======================
          const Text(
            'Energy Trend (kWh)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                minY: 48,
                maxY: 55,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, _) => Text('Day ${value.toInt() + 1}'),
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
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
                ],
              ),
            ),
          ),
          // =================== AKHIR dari GRAFIK DINAMIS ========================
        ],
      ),
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
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Icon Cuaca per Hari
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ForecastDay(icon: Icons.cloud, day: 'Thu', temp: '22°C'),
              ForecastDay(icon: Icons.thunderstorm, day: 'Fri', temp: '20°C'),
              ForecastDay(icon: Icons.wb_sunny, day: 'Sat', temp: '25°C'),
            ],
          ),

          const SizedBox(height: 30),

          // Ini buat predicted Input/Output/Saved per Hari
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: ForecastTriple(
                  day: 'Thu',
                  input: '+1.6 kWh',
                  output: '-1.8 kWh',
                  saved: '+38.6 kWh',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ForecastTriple(
                  day: 'Fri',
                  input: '+1.2 kWh',
                  output: '-2.0 kWh',
                  saved: '+36.0 kWh',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ForecastTriple(
                  day: 'Sat',
                  input: '+1.8 kWh',
                  output: '-1.5 kWh',
                  saved: '+40.2 kWh',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ForecastTriple extends StatelessWidget {
  final String day;
  final String input;
  final String output;
  final String saved;

  const ForecastTriple({
    super.key,
    required this.day,
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
          Text(
            day,
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ForecastData(title: 'Input', value: input, color: Colors.greenAccent),
          ForecastData(title: 'Output', value: output, color: Colors.redAccent),
          ForecastData(title: 'Saved', value: saved, color: Colors.green),
        ],
      ),
    );
  }
}

//Ini untuk class bagian middlenya kalau mau ubah ubah disini
class ForecastDay extends StatelessWidget {
  final IconData icon;
  final String day;
  final String temp;

  const ForecastDay({super.key, required this.icon, required this.day, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        Text(day, style: const TextStyle(color: Colors.white)),
        Text(temp, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}


class ForecastData extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const ForecastData({super.key, required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class AutomationPanel extends StatelessWidget {
  const AutomationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final double savedEnergy = 45.0; //  Ini juga diambil dari Backend untuk Saved Energy nya biar bisa otomatis
    final bool isAutoOn = savedEnergy >= 50.0;

    return Container(
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AUTOMATION STATUS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: 'Power saving mode starts when predicted saved energy is lower than '),
                TextSpan(
                  text: '+50.0 kwh',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            isAutoOn
                ? 'All devices are operating optimally.'
                : '⚠️ Automation: Turn off Air Conditioner, Water Pump, and Lighting System to save energy.',
            style: TextStyle(
              color: isAutoOn ? Colors.green : Colors.redAccent,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),

          // Status masing-masing perangkat (menggunakan Switch dan bergantung pada kondisi savedEnergy)
          AutomationDeviceStatus(deviceName: 'Air Conditioner', isOn: isAutoOn),
          AutomationDeviceStatus(deviceName: 'Water Pump', isOn: isAutoOn),
          AutomationDeviceStatus(deviceName: 'Lighting System', isOn: isAutoOn),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            deviceName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Switch(
            value: isOn,
            onChanged: null, // Nonaktifkan karena ini otomatis (tidak bisa digeser manual)
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red[200],
          ),
        ],
      ),
    );
  }
}

