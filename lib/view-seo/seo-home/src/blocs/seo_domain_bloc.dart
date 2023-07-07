import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/consts/consts.dart';
import 'package:web_flutter/routers/routers.dart';
import 'package:web_flutter/view-seo/seo-home/src/models/seo_servers_model.dart';

class SEODomainBloc with BodyMixin {
  int selectIndex = -1;
  List<DomainNameModel>? domainList;
  PagesScope pageScope = PagesScope();

  void onDomainTab(BuildContext context, int index, int id) {
    selectIndex = index;
    context.goNamed(AppRouters.addAccountNamed,
        extra: domainList?[index], queryParameters: {"serverId": "$id"});
  }

  void onPressed(MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }

}
