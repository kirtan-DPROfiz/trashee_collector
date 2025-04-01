/* import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Trashee Collector'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Dustbin Map'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Statistics'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Good Morning, Agent!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('Bins Collected', '12', Icons.delete),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child:
                      _buildStatCard('Waste Collected', '45 kg', Icons.scale),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Nearby Bins',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('Map Preview')),
            ),
            const SizedBox(height: 24),
            const Text('Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child:
                      _buildActionButton('Start Collection', Icons.play_arrow),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton('View Reports', Icons.analytics),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.grey)),
            Text(value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              // Notifications action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Reports'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dashboardCard("Total Bins", "150", Icons.delete),
                _dashboardCard("Full Bins", "30", Icons.warning),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Smart Bin Map",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text("[Map Placeholder]"),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Reports & Insights",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.pie_chart),
                    title: Text("Daily Collection Report"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.bar_chart),
                    title: Text("Weekly Collection Summary"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/fullbins.dart'
    show Fullbins;
import 'package:trashee_collecter/core/pages/DashboardPage/DashboardComponent/totalbins.dart';
import 'package:trashee_collecter/core/pages/logScreen.dart';
import 'package:trashee_collecter/core/pages/map_screen.dart';
import 'package:trashee_collecter/core/pages/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for bins (Replace with real data later)
  final int totalBins = 100;
  final int fullBins = 40; // 🔴 Full
  final int emptyBins = 30; // 🟢 Empty
  final int halfBins = 30; // 🟡 Half-full

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Smart Bin Dashboard"),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 2,
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Evening , Trashee Collectors!!",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent),
            ),
            const SizedBox(height: 10),
            const Text(
              "Overview",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Overview Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOverviewCard("Total Bins", totalBins, Colors.blue,
                    Icons.delete, Totalbins()),
                _buildOverviewCard("Full Bins", fullBins, Colors.red,
                    Icons.warning, Fullbins()),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*  _buildOverviewCard("Empty Bins", emptyBins, Colors.green,
                    Icons.check_circle, OnTap),
                _buildOverviewCard("Half-Full", halfBins, Colors.orange,
                    Icons.hourglass_bottom), */
              ],
            ),
            const SizedBox(height: 30),

            // Quick Actions
            const Text(
              "Quick Access",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildQuickAccessTile("Smart Bin Map", Icons.map, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            }),

            _buildQuickAccessTile("Statistics & Reports", Icons.bar_chart, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard(
      String title, int count, Color color, IconData icon, Widget screen) {
    return Expanded(
      child: InkWell(
        onTap: () {
          screen;
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(height: 10),
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text("$count",
                    style: TextStyle(
                        fontSize: 18,
                        color: color,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessTile(
      String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Trashee collecter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("Navigate through the app",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Smart Bin Map"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MapScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("Statistics & Reports"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => StatisticsScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text("Log-Screen"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => LogsScreen())),
          ),
        ],
      ),
    );
  }
}
