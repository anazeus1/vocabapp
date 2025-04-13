import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocabapp/main.dart';
import 'dart:async';

class ForgotPasswordPage extends StatefulWidget {
   ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
   final _emailController =TextEditingController();
   late final StreamSubscription<AuthState> _authSubscription;

   Future<void> resetPassword() async {
     try{
       await supabase.auth.resetPasswordForEmail(_emailController.text.trim(),redirectTo: "io.supabase.flutterquickstart://reset-callback/");
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text("check inbox"),
         
           ));
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
             content: const Text("Error.Please retry later"),
             backgroundColor:Theme.of(context).colorScheme.error ,
           )
       );
     }
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



   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("reset password"),),
      body: Column(
        children: [
          Text("Simply enter your email below and a link will be emailed to you to reset your password."),
          TextField(
            controller: _emailController,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed:resetPassword,
                  child: Text("send link")),
              TextButton(
                  onPressed:(){},
                  child: Text("cancel"))
            ],)

        ],
      ),
    );
  }
}
