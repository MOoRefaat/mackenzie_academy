import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/service_details_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> offers = List.generate(5, (index) => 'عرض ${index + 1}');

  final List<Map<String, dynamic>> services = [
    {'title': 'رحلات', 'icon': Icons.calendar_month},
    {'title': 'الاشتراكات', 'icon': Icons.card_membership},
    {'title': 'الإيواء', 'icon': Icons.add_home_outlined},
    {'title': 'المدربين', 'icon': Icons.group},
  ];

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color(0xFF0A155A),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/logo1.png',
                width: 200,
                height: 75,
                //   fit: BoxFit.none,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/Menu.svg',
                width: 78,
                height: 40,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
      ),
      endDrawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('الخدمات',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Handle show all
                  },
                  child: Text('عرض الكل'),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return _buildServiceCard(context, services[index]['title'],
                      services[index]['icon']);
                },
              ),
              SizedBox(height: 20),
              const Text('العروض',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Handle show all
                  },
                  child: Text('عرض الكل'),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      return _buildOfferCard(offers[index]);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 227,
      backgroundColor: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('محمد رفعت'),
              accountEmail: const Text('XXX12'),
              currentAccountPicture: Image.asset(
                'assets/images/profileIcon.png',
                width: 52,
                height: 48,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF0A155A),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.card_membership),
              title: const Text('اشتركاتي'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الاعدادات'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'تسجيل خروج',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(serviceName: title),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferCard(String title) {
    return SizedBox(
      width: 210,
      height: 115,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_offer, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
