// ignore_for_file: use_build_context_synchronously

import 'package:bank/build_context_ext.dart';
import 'package:bank/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  var _inited = false;

  Future<bool> initilize() async {
    _inited = true;
    // await Future.delayed(const Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(Routes.home);
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _inited ? null : initilize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }

        if (snapshot.data ?? false) {
          return OScreen();
        }

        return SplashScreen();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.theme.primaryColor,
        child: Center(
          child: Text(
            'Banking app',
            style: context.textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}

class OScreen extends StatelessWidget {
  const OScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
