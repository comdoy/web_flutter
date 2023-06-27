import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/seo-management/management.dart';

class TemplateCodePage extends StatelessWidget {
  const TemplateCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<TemplateCodeBloc>(context);
    return ChangeNotifierProvider<PagesScope>.value(
        value: bloc.pageScope,
        child: Consumer<PagesScope>(builder: (context, scope, child) {
          return const StatisticsCell();
        }));
  }
}