import 'dart:async';
import 'dart:math';
import 'package:animated_signuplogin_design/shake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../controller/homepagecontroller.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final HomePageController controller = Get.put(HomePageController());
  bool show=false,shakeButton=false,showPassword=false;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GetX<HomePageController>(
            builder: (controller) => Column(
              children: [
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
                        child:Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const Center(
                            child: Text("Signup", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 450,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black26,width: 3)
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 10,),
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
                                  child: TextFormField(
                                    style: const TextStyle(fontFamily: 'PopR'),
                                    onChanged: (String value){
                                      controller.validateFName(value.trim());
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Name",
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[400]!),
                                        ),
                                        errorText:controller.fName.value,
                                        focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(width: 2,color:(controller.fName.value=="")?Colors.black26:Colors.red)
                                        ),
                                        hintStyle: TextStyle(color: Colors.grey[600]),
                                        prefixIcon: const Icon(Icons.person)
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: const TextStyle(fontFamily: 'PopR'),
                                    onChanged: (String value){
                                      controller.validateEmail(value.trim());
                                    },
                                    decoration: InputDecoration(
                                        errorBorder:const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(width: 1,color: Colors.blueAccent),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(width: 2,color:(controller.email.value=="")?Colors.black26:Colors.red)
                                        ),
                                        errorText:controller.email.value,
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
                                    onChanged: (String value){
                                      controller.checkPassword(value.trim());
                                    },
                                    decoration: InputDecoration(
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[400]!),
                                        ),
                                        // errorText:controller.password.value,
                                        focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(width: 2,color:(controller.password.value=="")?Colors.black26:Colors.red)
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          LinearProgressIndicator(
                            value: controller.strength.value,
                            backgroundColor: Colors.grey[300],
                            color: controller.strength.value <= (0.25)
                                ? Colors.red
                                : controller.strength.value == (0.5)
                                ? Colors.yellow
                                : controller.strength.value == (0.75)
                                ? Colors.blue
                                : Colors.green,
                            minHeight: 15,
                          ),
                          const SizedBox(height: 30,),
                           ShakeWidget(
                            key: shakeKey,
                            shakeCount: 3,
                            shakeOffset: 10,
                            shakeDuration: const Duration(milliseconds: 500),
                            child:(!shakeButton)?Container():Container(
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
                                child: Text("Signup", style: TextStyle(fontFamily: 'PopB',fontSize: 20,color: Colors.white)),
                              ),
                            ),
                          ),
                          (shakeButton)?Container():InkWell(
                            onTap: ()
                            {
                             if(controller.validate &&  controller.strength.value > 0.74){
                               print("Signup");
                             }
                             else
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
                               }
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
                                child: Text("Signup", style: TextStyle(fontFamily: 'PopB',fontSize: 20,color: Colors.white)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?  ", style: TextStyle(color: Color.fromARGB(255,137,142,246),fontStyle: FontStyle.italic),),
                              InkWell(
                                onTap:(){
                                  Get.to(()=>const LogIn(),transition: Transition.zoom);
                                },
                                child: const Text("Signin ",style: TextStyle(color: Color.fromARGB(255, 110, 115, 225),
                                    fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'PopB'),),
                              ),
                            ],
                          )
                          ,
                        ],
                      ),
                    ],
                  )
                ).animate().shimmer(duration: const Duration(seconds: 1)).fadeIn(delay: 100.ms,curve: Curves.easeOut).then().flip(),
              ],
            ),
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
    // 1. return an AnimatedBuilder
    return AnimatedBuilder(
      // 2. pass our custom animation as an argument
      animation: animationController,
      // 3. optimization: pass the given child as an argument
      child: widget.child,
      builder: (context, child) {
        final sineValue =
        sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          // 4. apply a translation as a function of the animation value
          offset: Offset(sineValue * widget.shakeOffset, 0),
          // 5. use the child widget
          child: child,
        );
      },
    );
  }
}