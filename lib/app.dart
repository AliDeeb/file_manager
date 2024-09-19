import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/common/app_config.dart';
import 'core/common/provider_list.dart';
import 'core/navigation/route_generator.dart';
import 'core/theme/themes_data.dart';
import 'features/home/view/app_main/app_main_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) {
        return MultiProvider(
          providers: [...ApplicationProvider().dependItems],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppConfig.appNavigatorKey,
            onGenerateRoute: generateRoute,
            title: 'File manager',
            theme: ThemesData.lightTheme,
            themeMode: ThemeMode.light,
            home: AppMainView(param: AppMainViewParam()),
          ),
        );
      },
    );
  }
}
