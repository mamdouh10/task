import 'package:flutter/material.dart';
import 'package:task/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {


  Widget _Text(String text, FontWeight fontWeight, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ));
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
        title: _Text('  Create Account', FontWeight.bold, 25, Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        actions: const [],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Text('Create Account', FontWeight.bold, 45, Colors.black),
                  const SizedBox(
                    height: 15,
                  ),
                  _Text('Enter your Name, Email and Password',
                      FontWeight.normal, 18, Colors.black26),
                  Row(
                    children: [
                      _Text('for sign up.', FontWeight.normal, 18,
                          Colors.black26),
                      GestureDetector(
                        child: _Text(' Already have account?', FontWeight.bold,
                            20, Colors.green),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must not be Empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email address",
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email address must not be Empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black26,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Password must not be Empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(_emailController.text);
                          print(_passwordController.text);
                        }
                      },
                      child:
                          _Text("SIGN UP", FontWeight.bold, 25, Colors.white),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Center(
                    child: _Text('By Signing up you agree to our Terms',
                        FontWeight.normal, 17, Colors.black26),
                  ),
                  Center(
                    child: _Text('Conditions & Privacy Policy.',
                        FontWeight.normal, 17, Colors.black26),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: _Text('Or', FontWeight.bold, 25, Colors.black45),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(250, 59, 89, 152),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            CircleAvatar(
                              child: Image.asset('assets/images/facebook.png'),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            _Text('CONNECT WITH FACEBOOK', FontWeight.bold, 15,
                                Colors.white),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(250, 66, 133, 244),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            CircleAvatar(
                              child: Image.asset('assets/images/google.png'),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            _Text('CONNECT WITH GOOGLE', FontWeight.bold, 15,
                                Colors.white),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ))),
    );
  }
}
