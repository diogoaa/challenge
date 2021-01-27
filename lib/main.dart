import 'package:challenge/pages/authentication/login_page.dart';
import 'package:challenge/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    defaultHome: '/login',
  ));
}

class MyApp extends StatelessWidget {
  final String defaultHome;

  const MyApp({Key key, @required this.defaultHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: defaultHome,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
