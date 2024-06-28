import 'package:flutter/material.dart';
import 'package:passport/auth/main_components.dart';
import 'package:passport/auth/register.dart';
import '../common/values.dart';
import '../common/widgets.dart';
import '/auth/login.dart';

class ButtonsListScreen extends StatelessWidget {
  const ButtonsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Choose Flow'),
            Text('This screen will be removed.',style:  TextStyle(fontSize: 16),),

          ],
        ),
      ),
      body:  Center(
        child: Column(

          children: [
            PPValues.largeSpacing,

            SizedBox(
              width: 300,
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Main Components',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainComponents()),
                      );
                    },
                  ),
                ],
              ),
            ),
            PPValues.mediumSpacing,

            SizedBox(
              width: 300,
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Register',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            PPValues.mediumSpacing,

            SizedBox(
              width: 300,
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Sign In',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            PPValues.mediumSpacing,



          ],
        ),
      ),
    );
  }
}