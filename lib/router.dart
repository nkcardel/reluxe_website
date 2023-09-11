import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/screens/homepage.dart';

import 'controller/menuApp_controller.dart';
import 'fade_transition.dart';
import 'screens/properties.dart';

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
      GoRoute(
        path: "/properties",
        pageBuilder: (context, state) =>
            CustomFadeTransition(widgetChild: const PropertiesPage()),
      ),
    ],
  );
}
