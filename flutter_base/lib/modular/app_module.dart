import 'package:flutter_base/modular/comments_page.dart';
import 'package:flutter_base/modular/mail_service.dart';
import 'package:flutter_base/modular/nested/nested_module.dart';
import 'package:flutter_base/modular/profile/profile_module.dart';
import 'package:flutter_base/modular/user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory<AbstractMailSendMethod>((i) => SecondMailHandler()),
    Bind.singleton<AbstractMailService>((i) => MailService(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/comments', child: (context, args) => CommentsPage(list: args.data['list'],)),
    ChildRoute('/user/:id', child: (context, args) => UserPage(id: args.params['id'],)),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/nested', module: NestedModule())
  ];
}
