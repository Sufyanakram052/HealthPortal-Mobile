import 'package:htca_app/screens/start/splash/splash.dart';

import 'constants/exports.dart';
import 'core/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 932),
      minTextAdapt: true,
      // splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (ctx, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            navigatorKey: AppGlobals.navigatorKey,
            title: AppGlobals.appName,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            home: child,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          ),
        );
      },
      child: const Splash(),
    );
  }
}
