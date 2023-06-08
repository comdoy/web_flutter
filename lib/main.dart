import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Globals.oceanBlue,
          centerTitle: false,
          foregroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          actionsIconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      onGenerateTitle: (context) {
        return '你知道';
      },
      routeInformationParser: AppRouters.router.routeInformationParser,
      routerDelegate: AppRouters.router.routerDelegate,
      builder: IToast.init(),
    );
  }
}
