import 'package:flutter_modular/flutter_modular.dart';

import '../comments_page.dart';
import '../user_page.dart';
import 'nested_page.dart';

class NestedModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => NestedPage(), children: [
      ChildRoute('/first-page', transition: TransitionType.noTransition, child: (context, args) => CommentsPage(list: args.data['list'],)),
      ChildRoute('/second-page/:id', transition: TransitionType.noTransition, child: (context, args) => UserPage(id: args.params['id'],)),
    ])
  ];
}