import 'package:flutter/material.dart';
import 'package:instructify/presentation/screens/download/widgets/download_container.dart';

import 'widgets/download_app_bar.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          DownloadAppBar(),
          DownloadContainer(),
        ],
      ),
    );
  }
}
