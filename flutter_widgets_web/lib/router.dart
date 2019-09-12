import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/themes_demo.dart';
import 'package:flutter_widgets/themes/themes_notifier.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'swtch/switch_list_tile1.dart';
import 'unknown.dart';
import 'menus/sf_popupmenubutton.dart';
import 'menus/sl_popupmenubutton.dart';
import 'menus/webview.dart';

const String HOME = "/";
const String POP_UP_MENU_BUTTON_SL = '/popupMenuButton_sl';
const String POP_UP_MENU_BUTTON_SF = '/popupMenuButton_sf';
const String LIST_IMAGES = '/LIST_IMAGES';
const String WEBVIEW = '/webview';
const String SWITCH_LISTTILE_1 = 'SWITCH_LISTTILE_1';
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';
const String LOGIN_PAGE = 'LOGIN_PAGE';
const String THEMES_DEMO = 'THEMES_DEMO';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case THEMES_DEMO:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<ThemesNotifier>(
          child: ThemesDemo(),
          builder: (BuildContext context) {
            return ThemesNotifier();
          },
        );
      });
      break;

    case SWITCH_LISTTILE_1:
      return MaterialPageRoute(builder: (context) => SwitchListTile1());
      break;

    case POP_UP_MENU_BUTTON_SF:
      return MaterialPageRoute(
          builder: (context) => PopupMenuButtonWidgetStateFul());
      break;

    case POP_UP_MENU_BUTTON_SL:
      return MaterialPageRoute(
          builder: (context) => PopupMenuButtonWidgetStateLess());
      break;

    case WEBVIEW:
      return MaterialPageRoute(builder: (context) {
        final WebViewArguments args = routeSettings.arguments;
        return MyWebView(title: args.title, url: args.url);
      });
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}