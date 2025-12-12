import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/locale_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/admin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return MaterialApp(
            title: 'فاست بلاك تايجر لقطع الغيار',
            debugShowCheckedModeBanner: false,
            locale: localeProvider.locale,
            supportedLocales: const [Locale('ar'), Locale('en')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              primarySwatch: Colors.orange,
              fontFamily: 'Roboto',
            ),
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (_) => const SplashScreen(),
              AuthScreen.routeName: (_) => const AuthScreen(),
              HomeScreen.routeName: (_) => const HomeScreen(),
              ProductDetailScreen.routeName: (_) => const ProductDetailScreen(),
              CartScreen.routeName: (_) => const CartScreen(),
              AdminScreen.routeName: (_) => const AdminScreen(),
            },
          );
        },
      ),
    );
  }
}
