import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/components/components.dart';
import 'package:web_flutter/view-seo/view/blocs/add_server_bloc.dart';
import 'package:web_flutter/view-seo/view/components/site_settings_view.dart';

class AddServerPage extends StatelessWidget {
  const AddServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AddServerBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: VariousStatelessButton(
              onPressed: () => bloc.onSubmit(),
              color: Colors.blue,
              textColor: Colors.white,
              title: "提交",
            ),
          ),
          ITextListCell(
            title: "服务器",
            children: [
              ITextField(
                controller: bloc.inameController,
                width: 400,
                height: 35,
                hintText: "域名",
              ),
              const ITooltip(message: "英文逗号分隔多个域名")
            ],
          ),
          ITextListCell(
            title: "地点",
            children: [
              ITextField(
                controller: bloc.locationController,
                width: 400,
                height: 35,
                hintText: "域名",
              ),
              const ITooltip(message: "英文逗号分隔多个域名")
            ],
          ),
          ITextListCell(
            title: "投诉理由",
            children: [
              ITextField(
                controller: bloc.ispController,
                width: 400,
                height: 35,
                hintText: "投诉理由",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
