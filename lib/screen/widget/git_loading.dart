import 'package:flutter/material.dart';
import 'package:github_search/screen/shared/assets.dart';
import 'package:lottie/lottie.dart';

class GitLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( child: Center(
      child: Lottie.asset(loadingIcon,fit: BoxFit.cover,
          alignment: Alignment.center,

      ),
    ),
    );
  }
}
