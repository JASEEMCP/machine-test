

import 'package:app/main.dart';

class ScreenPath {

  static const splash = '/';
  /// Auth routes
  static const login = '/login';
  static  signupOtp(String phn) => '/login/otp?phn=$phn';
  static register() => _appendIdIntoCurrentPath('/phone');
  static const forgotPwd = '/forgot';
  static resetPwd(String email) => _appendIdIntoCurrentPath('/reset?e=$email');

  /// Main routes
  
  static  chat() => _appendIdIntoCurrentPath('/chat');
  static const messages = '/messages';





  ///Appending path
  static _appendIdIntoCurrentPath(String path) {
    final newPathUri = Uri.parse(path);
    final currentPathUri = appRouter.routeInformationProvider.value.uri;
    Map<String, dynamic> parm = Map.of(currentPathUri.queryParameters);
    parm.addAll(newPathUri.queryParameters);
    Uri? loc = Uri(
        path: '${currentPathUri.path}/${newPathUri.path}'.replaceAll('//', '/'),
        queryParameters: parm);
    final newPath = path.replaceAll('/', '');
    return loc.toString().replaceAll('$newPath/$newPath', newPath);
  }
}
