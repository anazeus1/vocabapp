import 'package:flutter/material.dart';
import 'package:vocabapp/page/login_page.dart';
import 'package:vocabapp/page/TestList.dart';
import 'package:vocabapp/page/levelList.dart';
import 'package:vocabapp/page/register_page.dart';
import 'package:vocabapp/page/forgot_pasword_page.dart';
import 'package:vocabapp/page/splash_page.dart';
import 'package:vocabapp/page/TestList.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future main() async {
  usePathUrlStrategy();
  await Supabase.initialize(
  );

  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.blue[150],
    ),
    routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) =>  LoginPage(),
      '/level_list': (BuildContext context) => LevelList(),
      '/register': (BuildContext context) => RegisterPage(),
      '/forgot_password': (BuildContext context) => ForgotPasswordPage(),
    },

  ));
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Supabase Flutter');
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}