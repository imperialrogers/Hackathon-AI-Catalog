import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:hackathon_gpt/Frontend/screen/logInScreen.dart';
import 'package:hackathon_gpt/Frontend/screen/secondScren.dart';

import '../../Backend/auth/auth_services.dart';

enum Auth {
  signin,
  signup,
}

class SignInPage extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

// ignore: prefer_final_fields
  Auth _auth = Auth.signup;
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20262E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70.0),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SecondScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.white,
                    )),
                const SizedBox(height: 20.0),
                Row(
                  children: const [
                    Text(
                      'Hello there',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Gotham',
                      ),
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/images/hand.png'),
                      width: 50,
                      height: 60,
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Please enter your email & password to create an account',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontFamily: 'Gotham',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter UserName";
                    }
                    return null;
                  },
                  cursorColor: const Color.fromRGBO(0, 166, 126, 100),
                  decoration: const InputDecoration(
                    hintText: 'User Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.person_2_rounded,
                      color: Color.fromRGBO(0, 166, 126, 100),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(2, 190, 146, 0.612)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 166, 126, 100)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter email";
                    }
                    return null;
                  },
                  cursorColor: const Color.fromRGBO(0, 166, 126, 100),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromRGBO(0, 166, 126, 100),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(2, 190, 146, 0.612)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 166, 126, 100)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                  cursorColor: const Color.fromRGBO(0, 166, 126, 100),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(0, 166, 126, 100),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(2, 190, 146, 0.382)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 166, 126, 100)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.grey,
                      ),
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: const Color.fromRGBO(0, 166, 126, 100),
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'I agree to chat AI ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gotham',
                          ),
                        ),
                        Text(
                          ' Public Agreement,Terms ',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 166, 126, 100),
                            fontFamily: 'Gotham',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    ' & Privacy Policy.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 166, 126, 100),
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            signUpUser();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(0, 166, 126, 100)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            elevation: MaterialStateProperty.all<double>(5.0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Gotham',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 166, 126, 100),
                          fontSize: 15,
                          fontFamily: 'Gotham',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color.fromARGB(255, 209, 206, 206),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Continue With",
                        style: TextStyle(
                          color: Color.fromARGB(255, 209, 206, 206),
                          fontFamily: 'Gotham',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color.fromARGB(255, 209, 206, 206),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: SignInButton(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    Buttons.Google,
                    text: "Sign in with Google",
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
