import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learn_localization_g10/pages/home_page.dart';
import 'package:learn_localization_g10/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU'), Locale("uz", "UZ")],
      path: 'assets/translations',
      startLocale: const Locale("ru", "RU"),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      initialRoute: "/home_page",
      routes: {
        "/home_page": (context) => const HomePage(),
        "/welcome_page": (context) => const WelcomePage(),
      },
    );
  }
}
