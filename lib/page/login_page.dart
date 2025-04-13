import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocabapp/main.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //controllers
  final _emailController= TextEditingController();
  final _passwordController= TextEditingController();

  //for correct resource disposal
  late final StreamSubscription<AuthState> _authSubscription;

  //password visibity
  bool isObscure=true;
  Icon visibility_icon=Icon(Icons.visibility_off);
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authSubscription.cancel();

    super.dispose();
  }

  @override
  void initState() {

    super.initState();
    _authChange();
  }

  //listener for login event
  Future<void> _authChange() async{
      _authSubscription=supabase.auth.onAuthStateChange.listen((event){
        final session =event.session;
        if(session!=null){
          Navigator.of(context).pushReplacementNamed("/level_list");
        }
      });
  }


  //password email sign in
  Future<void> signIn() async {
    try{
      await supabase.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text);
    }
    on AuthException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor:Theme.of(context).colorScheme.error ,
          )
      );
    }
    catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Error.Pleae retry later"),
            backgroundColor:Theme.of(context).colorScheme.error ,
          )
      );
    }
  }

  //password visibility
  void changeVisibility(){
    setState(() {
      isObscure = !isObscure;
      if(isObscure){
        visibility_icon=const Icon(Icons.visibility_off);
      }else{
        visibility_icon=const Icon(Icons.visibility);
      }

    });
  }

  void resetPasswordForEmail(){

  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Nice to see you again",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email or phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: "Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        onPressed: changeVisibility,
                        icon:  visibility_icon),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(

                    onPressed: (){
                      Navigator.of(context).pushNamed("/forgot_password");
                    },
                    child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue),

                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:(){ signIn();},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Sign in",style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {},

                  label: const Text(
                      "Or sign in with Google",),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/register");
                      },
                      child: const Text(
                          "sign up now",
                          style: TextStyle(color: Colors.blue),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Placeholder for logo
                Image.asset(
                  "assets/app_logo.png",
                  height: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  "©Selsa 2024",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}