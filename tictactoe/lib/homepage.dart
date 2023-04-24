import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; // first player is o
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int oScore = 0;
  int xScore = 0;

  int filledBoxes = 0;

  static var myNewfont = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 12));
  static var myNewfont2 = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.blue, letterSpacing: 2, fontSize: 12));
  static var myNewfontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  static var myNewfontWhite2 = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.green, letterSpacing: 3, fontSize: 18));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player O",
                          style: myNewfontWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          oScore.toString(),
                          style: myNewfontWhite2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X",
                          style: myNewfontWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          xScore.toString(),
                          style: myNewfontWhite2,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          displayXO[index],
                          style: myNewfontWhite,
                        )),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              child: Center(
                  child: Column(
                children: [
                  Text(
                    'TIC TAC TOE ',
                    style: myNewfontWhite,
                  )
                ],
              )),
            )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check the 1 row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    }
    //check 2 row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showDialog(displayXO[3]);
    }
    //check 3 row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showDialog(displayXO[6]);
    }
    //check 1 column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    }
    //check 2 colomn
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showDialog(displayXO[1]);
    }
    //check 3 colomn
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showDialog(displayXO[2]);
    }
    //check 1 diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showDialog(displayXO[0]);
    }
    //check 2 diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white70,
            title: Text('Game Draw! :\( '),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < 9; i++) {
                        displayXO[i] = '';
                      }
                      filledBoxes = 0;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('PLay Again!', style: myNewfont2))
            ],
          );
        });
  }

  void _showDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white70,
            title: Text(
              'WINNER IS ' + winner,
              style: myNewfont,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < 9; i++) {
                        displayXO[i] = '';
                      }
                      filledBoxes = 0;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'PLay Again!',
                    style: myNewfont2,
                  ))
            ],
          );
        });
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }
}
