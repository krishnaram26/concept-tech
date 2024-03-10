import 'package:concept_technologies_app/dashboard.dart';
import 'package:concept_technologies_app/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("lib/images/office.jpg",
                      fit: BoxFit.fitWidth,
                      color: const Color.fromRGBO(0, 0, 0, 0.50),
                      colorBlendMode: BlendMode.darken),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Asset Management Software",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to AMS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("User ID"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                const Text("Password"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Text("Reset Password"),
                      onTap: () {
                        print("Reset Password");
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20)),
                      // Within the `FirstRoute` widget
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30),
                        child: Text(
                          'Signup',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
