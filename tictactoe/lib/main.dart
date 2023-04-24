import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static var myNewfontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 24));
  static var myNewfontWhite2 = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            //text tic tac toe
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'TIC TAC TOE ',
                style: myNewfontWhite,
              ),
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          //animation
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_ndjggbxg.json'),
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          //button play now

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    'PLAY NOW',
                    style: myNewfontWhite2,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
