import 'package:flutter/material.dart';
import 'package:task/signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {


  Widget _Text(String text, FontWeight fontWeight, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        //wordSpacing: -7,
      ),
    );
  }

  Widget _TextFormField ( controller ,  keyboardType ,  hintText,  textValidator , obscureText , suffixIcon ){
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        suffixIcon: suffixIcon ? IconButton(
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
        ) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value){
        if(value!.isEmpty) {
          return '$textValidator';
        }
        return null;
      },
    );
  }

  bool _passwordVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  _Text('Welcome', FontWeight.bold, 45, Colors.black),
                  const SizedBox(
                    height: 15,
                  ),
                  _Text('Enter your Email address to sign in.',
                      FontWeight.normal, 18, Colors.black26),
                  const SizedBox(
                    height: 8,
                  ),
                  _Text('Enjoy your food :)', FontWeight.normal, 20,
                      Colors.black26),
                  const SizedBox(
                    height: 20,
                  ),
                  _TextFormField (_emailController, TextInputType.emailAddress, 'EmailAddress' , 'EmailAddress must not be empty' , false , false),
                  const SizedBox(
                    height: 15,
                  ),
                  _TextFormField(_passwordController, TextInputType.visiblePassword, 'Password', 'Password must not be empty', _passwordVisible, true),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(200, 8, 0, 20),
                    child: _Text('Forget Password?', FontWeight.bold, 15,
                        Colors.black26),
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
                          _Text("SIGN IN", FontWeight.bold, 25, Colors.white),
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
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: _Text("Don't have account?", FontWeight.normal,
                            17, Colors.black26),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: _Text("Create new account", FontWeight.bold, 17,
                            Colors.green),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SignUpScreen()));
                        },
                      ),
                    ],
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
          ),
        ),
      ),
    );
  }
}
