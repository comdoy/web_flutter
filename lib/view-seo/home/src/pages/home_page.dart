import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter/utils/utils.dart';
import 'package:web_flutter/view-pages/page.dart';
import '../../../../../components/components.dart';
import '../../../../../routers/src/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Body(
        onInit: bloc.onInit,
        controller: bloc.controller,
        child: Stack(
          children: [
            const Positioned.fill(
              child: INetworkImage(
                fit: BoxFit.cover,
                placeholder: ImgAsset.beijing,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  value: "SEO工作台",
                  onTap: () {
                    context.goNamed(
                      AppRouters.complaintNamed,
                      queryParameters: bloc.queryParameters,
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedButton(
                  value: "管理员",
                  onTap: () {
                    context.go(AppRouters.complaintPath);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
