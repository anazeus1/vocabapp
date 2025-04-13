import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocabapp/main.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController  =TextEditingController();
  final _passwordController  =TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    try{
      await supabase.auth.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text
      );
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("registration successful")));
      }
    }on AuthException catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(e.message),
              backgroundColor: Theme.of(context).colorScheme.error,
          ));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("error.try again later"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ));

    }


  }

  void snackMessage(String text){


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(



        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'ex: jon smith',

              ),
            ),
            SizedBox(height: 8),
            TextField(
             decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'ex: name.surname@email.com',
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                ),
                obscureText: true,
              ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Confirm password',),
                obscureText: true,
              ),
            SizedBox(height: 16),
            Row(
              children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text('I understand the terms & policy.'),
                ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){signUp();},
              child: Text('SIGN UP'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
            ),
            SizedBox(height: 16),
            Text('or sign up with'),
            SizedBox(height: 16),
            ]
          )
      )
    );
  }
}