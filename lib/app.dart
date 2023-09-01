import 'package:assignmentfinal/constants/global_variable.dart';
import 'package:assignmentfinal/features/auth/ViewModel/auth_sevice.dart';
import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:assignmentfinal/router.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';

import 'common/bottom_bar.dart';
import 'features/admin/View/admin_screen.dart';
import 'features/auth/View/auth_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_e1ed7b203413484c9d557948423e6d8f",
      builder: (context, navigatorKey) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Anime world',
          theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            useMaterial3: true,
          ),
          onGenerateRoute: (settings) => generateRoute(settings),
          home: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.type == 'user'
                  ? const BottomBar()
                  : const AdminScreen()
              : const AuthScreen(),
        );
      },
    );
  }
}
