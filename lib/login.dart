import 'dart:async';
import 'dart:math';
import 'package:animated_signuplogin_design/shake.dart';
import 'package:animated_signuplogin_design/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);


  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  bool show=false,shakeButton=false,showPassword=false;
  final shakeKey = GlobalKey<ShakeWidgetState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 320,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-1.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child:  Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-2.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child:  Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/clock.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      child:  Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 400,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26,width: 3),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 14,),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email ",
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  prefixIcon: const Icon(Icons.email_outlined)
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: const TextStyle(fontFamily: 'PopR'),
                              obscuringCharacter: '*',
                              obscureText: (showPassword)?true:false,
                              decoration: InputDecoration(
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400]!),
                                  ),
                                  // errorText:controller.password.value,
                                  focusedErrorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(width: 2,color:Colors.black26)
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  prefixIcon: const Icon(Icons.lock_open),
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      showPassword=!showPassword;
                                    });
                                  },
                                    icon: Icon((showPassword)?Icons.visibility_off:Icons.visibility),)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ShakeWidget(
                      key: shakeKey,
                      shakeCount: 3,
                      shakeOffset: 10,
                      shakeDuration: const Duration(milliseconds: 500),
                      child:(!shakeButton)?Container(): Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child:  const Center(
                          child: Text("Login", style: TextStyle(fontFamily: 'PopB',fontSize: 20,color: Colors.white),),
                        ),
                      ),
                    ),
                    (shakeButton)?Container():InkWell(
                      onTap: ()
                      {
                        shakeKey.currentState?.shake();
                        setState(() {
                          shakeButton=true;
                        });
                        Timer(
                          const Duration(seconds: 3),
                              () {
                            setState(() {
                              shakeButton=false;
                            });
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(fontFamily: 'PopB',fontSize: 20,color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Align(alignment:Alignment.topRight,child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    const SizedBox(height: 50,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?  ", style: TextStyle(color: Color.fromARGB(255,137,142,246),fontStyle: FontStyle.italic),),
                        InkWell(
                          onTap:(){
                            Get.to(()=>const SignUp(),transition: Transition.zoom);
                          },
                          child: const Text("Signup ",style: TextStyle(color: Color.fromARGB(255, 110, 115, 225),
                              fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'PopB'),),
                        ),
                      ],
                    )
                  ],
                ),
              ).animate().shimmer(duration: const Duration(seconds: 1)).fadeIn(delay: 100.ms,curve: Curves.easeOut).then().flip(),
            ],
          ),
        )
    );
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }
  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue =
        sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}