import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  bool isSwitched = false;
  bool? isChecked = true;
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/accounts/accounts.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "My Profile",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            iconTheme: IconThemeData(color: Colors.white, size: 30),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 112,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Color.fromARGB(200, 11, 2, 26),
                            spreadRadius: 4)
                      ],
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(255, 16, 5, 34)),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.deepPurple,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Arthur Dent",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Space adventurer"),
                            )
                          ],
                        ),
                        IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: Color.fromARGB(200, 11, 2, 26))
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Switch(
                              inactiveTrackColor: Colors.black,
                              activeColor: Colors.black,
                              activeTrackColor:
                                  Color.fromARGB(255, 45, 192, 202),
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  _opacity = (_opacity == 0) ? 1 : 0;
                                });
                              }),
                          Text(
                            "Show planetary progress",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 250,
                              width: 250,
                              child: CircularProgressIndicator(
                                strokeWidth: 15,
                                value: 13 / 100,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 214, 214),
                                valueColor: AlwaysStoppedAnimation(
                                    Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            top: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Personal",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  "progress",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  "87.1",
                                  style: Theme.of(context).textTheme.titleLarge,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                          .animate(
                            target: isSwitched ? 0 : 1,
                          )
                          .fadeOut(duration: 2.seconds, curve: Curves.easeInOut)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        }),
                    Text(
                      "Show me in Planet Rating",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        }),
                    Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
