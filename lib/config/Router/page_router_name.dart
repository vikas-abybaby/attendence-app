class PageRouterName {
  final String name;
  final String path;
  const PageRouterName({required this.name, required this.path});
}

class Routes {
  static const PageRouterName splashScreen = PageRouterName(
    name: "splash_screen",
    path: "/splash_screen",
  );
  static const PageRouterName loginScreen = PageRouterName(
    name: "login_screen",
    path: "/login_screen",
  );
  static const PageRouterName changePasswordScreen = PageRouterName(
    name: "change_password_screen",
    path: "/change_password_screen",
  );
  static const PageRouterName homeScreen = PageRouterName(
    name: "home_screen",
    path: "/home_screen",
  );
  static const PageRouterName userScreen = PageRouterName(
    name: "user_screen",
    path: "/user_screen",
  );
}
