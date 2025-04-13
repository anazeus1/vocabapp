import 'package:flutter/material.dart';
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _password_controller= new ;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ,
      body: Column(
        children: [
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
