import 'package:challenge/helpers/user_helper.dart';
import 'package:challenge/pages/authentication/login_page.dart';
import 'package:challenge/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_Br';

  final home = await UserHelper.getHome();

  runApp(MyApp(defaultHome: home));
}

class MyApp extends StatelessWidget {
  final String defaultHome;

  const MyApp({Key key, @required this.defaultHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: defaultHome,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
    );
  }
}
