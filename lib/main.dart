import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/theme.dart';
import 'services/services.dart';
import 'screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Report>.value(value: Global.reportRef.documentStream),
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: ChangeNotifierProvider<ThemeChanger>(
        builder: (_) => ThemeChanger(ThemeStatus.DARK),
        child: MaterialTheme(),
      ),
    );
  }
}

class MaterialTheme extends StatefulWidget {
  @override
  _MaterialThemeState createState() => _MaterialThemeState();
}

class _MaterialThemeState extends State<MaterialTheme> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ThemeChanger theme = Provider.of<ThemeChanger>(context);
      theme.setTheme(ThemeStatus.DARK);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme,
      // Named Routes
      routes: {
        '/': (context) => LoginScreen(),
        '/topics': (context) => TopicsScreen(),
        '/article': (context) => ArticleScreen(),
        '/profile': (context) => ProfileScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
