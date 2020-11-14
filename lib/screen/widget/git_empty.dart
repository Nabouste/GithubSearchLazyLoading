import 'package:flutter/material.dart';
import 'package:github_search/screen/shared/assets.dart';
import 'package:lottie/lottie.dart';

class GitEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(emptyIcon,fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }
}
