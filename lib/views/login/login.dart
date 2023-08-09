import 'package:cosmic/views/favorites/favorites.dart';
import 'package:cosmic/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profile/accounts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              image: AssetImage(
                "assets/login/login01.png",
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          SizedBox(
            height: 50,
          ),
          SvgPicture.asset("assets/splash/Vector.svg"),
          const SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 106, 170),
                backgroundBlendMode: BlendMode.modulate,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.grey, width: 0.5),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, -4))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text("Email"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          label: Text(
                            "Password",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 16,
                                  color:
                                      const Color.fromRGBO(18, 219, 232, 1.0)),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: InkRipple.splashFactory,
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(0, 0, 230, 230)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Ink(
                        width: 300,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            stops: [0.1, 0.51, 1.00],
                            colors: [
                              Color.fromRGBO(119, 136, 196, 1),
                              Color.fromRGBO(0, 230, 230, 1),
                              Color.fromRGBO(204, 81, 223, 1),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Sign In",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "or sign in using",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            iconSize: 30,
                            //splashRadius: 1,
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/login/twitter.svg")),
                        IconButton(
                            onPressed: () {},
                            icon:
                                SvgPicture.asset("assets/login/facebook.svg")),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/login/google.svg"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: const Color.fromRGBO(18, 219, 232, 1.0)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
