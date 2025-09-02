// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'core/localization/language_cubit.dart';
import 'core/resources/app_colors.dart';
import 'core/resources/shared_app_strings.dart';
import 'core/theme/theme_cubit.dart';
import 'l10n/app_localizations.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const PerplexityClone(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class PerplexityClone extends StatefulWidget {
  const PerplexityClone({super.key});

  @override
  State<PerplexityClone> createState() => _PerplexityCloneState();
}

class _PerplexityCloneState extends State<PerplexityClone> {
  late final ThemeCubit themeCubit;
  late final LanguageCubit languageCubit;

  @override
  void initState() {
    themeCubit = sl<ThemeCubit>();
    languageCubit = sl<LanguageCubit>();
    languageCubit.getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>(),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => sl<LanguageCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(440, 956),
        child: BlocBuilder<ThemeCubit, ThemeData>(
          bloc: themeCubit,
          builder: (final context, final themeState) {
            return BlocBuilder<LanguageCubit, Locale>(
              bloc: languageCubit,
              builder: (final context, final localeState) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: SharedAppStrings.appNameString, // Your app name here
                  locale: localeState,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [Locale('en'), Locale('hi'), Locale('mr')],
                  theme: themeState,
                  themeMode: ThemeMode.light,
                  routerConfig: router,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(.8)),
                      child: child!,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
