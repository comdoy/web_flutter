import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/net-work/src/api/api.dart';

class AddReasonBloc with BodyMixin {
  PagesScope pagesScope = PagesScope();
  void onSubmit() async {
    try {
      UX.show();
      await HomeRequest.postReason(
        reason: reasonController.text,
      );
      UX.toast("成功");
      reasonController.clear();
      pagesScope.update();
      UX.hidden();
    } catch (e) {
      UX.hidden();
      UX.toast(e.toString());
    }
  }

  final TextEditingController reasonController = TextEditingController();
}
