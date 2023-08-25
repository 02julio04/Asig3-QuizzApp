import 'package:flutter/material.dart';
import 'questionQuizz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Objeto de quizzQuestion
quizzQuestion question = quizzQuestion();

void main() {
  runApp(const quizz());
}

class quizz extends StatelessWidget {
  const quizz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: HomePage(),
        ),
        ),
        ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }
  List<Icon> scoreIcon = [];//Una lista que contiene íconos para mostrar si las respuestas del usuario son correctas o incorrectas.
  int correct = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = question.getQuestionAnswer;
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreIcon.add(
          Icon(
            Icons.check,
            color: Colors.green,

          ),
        );
        correct++;
      } else {
        scoreIcon.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                question.getQuestionText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)
              ),
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ), onPressed: () {
              //The user picked true.
              if(question.getQuestionCount == 10)
              {
                checkAnswer(true);
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text('Tu puntuación es $correct de 11'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => runApp(quizz()),
                        child: const Text('Reiniciar'),
                      ),
                    ],
                  ),
                );
              }
              else
              {
                checkAnswer(true);
              }

              setState(() {
                question.nextQuestion();
              });

            },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                if(question.getQuestionCount == 10)
                {
                  checkAnswer(false);
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text('Tu puntuación es $correct de 11'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => restartApp(),
                          child: const Text('Reiniciar'),
                        ),
                      ],
                    ),
                  );
                }
                else
                {
                  checkAnswer(false);
                }
                setState(() {
                  question.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreIcon,
        )
      ],
    );
  }
}