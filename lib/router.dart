import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/homepage.dart';

import 'controller/menuApp_controller.dart';
import 'fade_transition.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ],
          child: const HomePage(),
        ),
        pageBuilder: (context, state) =>
            CustomFadeTransition(widgetChild: const HomePage()),
      ),
    ],
  );
}
