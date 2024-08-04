import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/loading_manager.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_card.dart';
import 'package:mackenzie_academy/features/home/data/models/services_item.dart';
import 'package:mackenzie_academy/features/home/data/models/users_services.dart';
import 'package:mackenzie_academy/features/home/presentation/bloc/home_bloc.dart';
import 'package:mackenzie_academy/features/service_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final UsersServices? usersServices;

  HomeScreen({super.key, this.usersServices});

  // UsersServices
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> offers = List.generate(5, (index) => 'عرض ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeInitial) {
            // TODO  : check if email and password is remembered
          } else if (state is LogoutLoadingState) {
            _loadingState();
          } else if (state is LogoutSuccessState) {
            _logoutSuccessState(context);
          } else if (state is NetworkErrorState) {
            _failErrorMessage(errorMessage: state.message, context: context,);
          } else if (state is NavigateToLoginScreenState) {
            _navigateToLogin(context);
          }
        },
        builder: (context, state) {
          return _homeWidget(context);
        },
      ),
    );
  }
  Widget _homeWidget (BuildContext context) {
    return
      Scaffold(
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
        endDrawer: _buildDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (usersServices != null && usersServices!.servicesList.isNotEmpty)
          ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('الخدمات',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Handle show all
                    },
                    child: Text('عرض الكل'),
                  ),
                ),
                // todo : usersServices?.servicesList.isNotEmpty ?

                _buildServiceList(userServices.servicesList),
                SizedBox(height: 20),
                const Text('العروض',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
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
          )
              : Text("Something wrong"),
        ),
      );
  }

  Widget _buildDrawer(BuildContext context) {
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
                BlocProvider.of<HomeBloc>(context).add(LogoutEvent());
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

  Widget _buildServiceList(List<ServicesItem> servicesList) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: servicesList.length,
      itemBuilder: (context, index) {
        return CustomCard(
          cardLabelText: servicesList[index].title,
          cardIcon: servicesList[index].icon,
        );

        _buildServiceCard(context, usersServices!.servicesList[index].title,
            usersServices!.servicesList[index].icon);
      },
    );
  }

  // states fun
  void _loadingState() {
    LoadingManager().showLoading();
  }

  void _failErrorMessage({required String errorMessage,required BuildContext context}) {
    LoadingManager().hideLoading();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${errorMessage}"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _logoutSuccessState(BuildContext context) {
    LoadingManager().hideLoading();
    BlocProvider.of<HomeBloc>(context).add(NavigateToLoginScreenEvent());
  }

  void _navigateToLogin(BuildContext context) {
    LoadingManager().hideLoading();
    Navigator.of(context).pushNamed(RoutesName.loginRoute);
  }

}
