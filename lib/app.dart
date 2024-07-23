import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    Future.delayed(const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final isMobile = deviceSize.shortestSide < 600;
    List<DeviceOrientation> listOrientation = [DeviceOrientation.portraitUp];
    if(!isMobile){
      listOrientation = [DeviceOrientation.landscapeLeft];
    }
    SystemChrome.setPreferredOrientations(listOrientation);
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: GetMaterialApp(
          navigatorKey: Get.key,
          enableLog: false,
          debugShowCheckedModeBanner: false,
          color: Colors.red,
          theme: ThemeData.light(),
          title: 'Note App',
          getPages: AppPages.routes,
          initialRoute: Routes.note,
        )
    );
  }
}

