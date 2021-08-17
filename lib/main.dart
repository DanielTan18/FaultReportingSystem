import 'package:flutter/material.dart';
import 'package:fyp1_test/providers/app.dart';
import 'package:fyp1_test/providers/faultreport.dart';
import 'package:fyp1_test/screens/home.dart';
import 'package:fyp1_test/screens/login.dart';
import 'package:fyp1_test/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'providers/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: FaultReportProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fault Reporting App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
