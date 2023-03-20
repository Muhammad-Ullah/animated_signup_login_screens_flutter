import 'package:animated_signuplogin_design/signup.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.yellow, Colors.red, Color.fromARGB(255,128,133,239)],
                stops: [0.1, 0.7,0.56]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200,),
              _OpenContainerWrapper(
                transitionType: _transitionType,
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return _InkWellOverlay(
                    openContainer: openContainer,
                    height: 50,
                    child: Container(
                      width: 220,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:const Color.fromARGB(255,27,136,147),),
                          color: const Color.fromARGB(255,27,136,147),
                      ),
                      child: const Text("Get Started",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ).animate().flip(duration: const Duration(seconds: 2))
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SwitchListTile(
                    value: _slowAnimations,
                    onChanged: (bool value) async {
                      setState(() {
                        _slowAnimations = value;
                      });
                      if (_slowAnimations) {
                        await Future<void>.delayed(const Duration(milliseconds: 300));
                      }
                      timeDilation = _slowAnimations ? 20.0 : 1.0;
                    },
                    title: const Text('Slow animations'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
  //   if (isMarkedAsDone ?? false) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Marked as done!'),
  //     ));
  //   }
  // }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const SignUp();
      },
      closedElevation: 0.0,
      openColor: Colors.transparent,
      closedColor: Colors.transparent,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}


class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.height,
    this.child,
  });

  final VoidCallback? openContainer;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}
