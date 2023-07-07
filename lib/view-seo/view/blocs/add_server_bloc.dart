import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/net-work/src/api/api.dart';

class AddServerBloc with BodyMixin {
  PagesScope pagesScope = PagesScope();
  final TextEditingController inameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ispController = TextEditingController();

  void onSubmit() async {
    try {
      UX.show();
      String iname = inameController.text;
      String location = locationController.text;
      String isp = ispController.text;

      await HomeRequest.postAddServer(
        iname: iname,
        location: location,
        isp: isp,
      );
      UX.hidden();
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }
}
