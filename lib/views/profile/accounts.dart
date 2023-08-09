import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

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
              Container(
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
                            activeColor: Colors.black,
                            activeTrackColor: Color.fromARGB(255, 45, 192, 202),
                            value: true,
                            onChanged: (bool) {}),
                        Text(
                          "Show planetary progress",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
