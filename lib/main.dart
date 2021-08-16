import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  String _infoText = "Há vagas";

  void _countRoom(int delta) {
    setState(() {
      _counter += delta;

      if (_counter < 0) {
        _infoText = "Quartos em manutenção";
      } else if (_counter > 10) {
        _infoText = "Não há vagas";
      } else {
        _infoText = "Há vagas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/hotel_room.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BorderedText(
              strokeWidth: 5.0,
              child: Text(
                "Quartos alocados: $_counter",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      _countRoom(-1);
                    },
                    child: BorderedText(
                      strokeWidth: 3.0,
                      child: Text(
                        "-1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      _countRoom(1);
                    },
                    child: BorderedText(
                      strokeWidth: 3.0,
                      child: Text(
                        "+1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BorderedText(
              strokeWidth: 3.0,
              child: Text(
                _infoText,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
