import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/repository/constants/assets_path.dart';
import 'package:edu_app/src/repository/services/auth_services.dart';
import 'package:edu_app/src/ui/pages/bottom_navbar_view.dart';
import 'package:edu_app/src/ui/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:edu_app/src/ui/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class AppSplashPage extends ConsumerStatefulWidget {
  const AppSplashPage({super.key});

  @override
  ConsumerState createState() => _AppSplashPageState();
}

class _AppSplashPageState extends ConsumerState<AppSplashPage> {
  void enter() async {
    AuthServices().enterToApp().then((value) {
      Future.delayed(const Duration(seconds: 3), () {
        if (value.isNotEmpty) {
          // printer(value);
          ref.read(userTokenProvider.notifier).state = value;
          Go(context).id(BottomNavBarView.id);
        } else {
          Go(context).id(SignInPage.id);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    enter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AssetsPath.loadingAnimation),
      ),
    );
  }
}
