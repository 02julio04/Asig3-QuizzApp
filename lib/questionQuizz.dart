import 'quizzData.dart';

class quizzQuestion{

  //questionCount mantiene el índice de la pregunta actual
  int _questionCount = 0;
  List<Data>_questionList = [
    Data('The Axolotl is an amphibian that can spend its whole life in a larval state.', true),//1
    Data('Leonardo DiCaprio won an Oscar for Best Actor in 2004&#039;s &quot;The Aviator&quot', false),
    Data('Kangaroos keep food in their pouches next to their children.', false),
    Data('The film &quot;2001: A Space Odyssey&quot; was released on December 31st, 2000.', false),
    Data('A bear does NOT defecate during hibernation.', true),
    Data('In 2016, the IUCN reclassified the status of Giant Pandas from endangered to vulnerable.', true),
    Data('A caterpillar has more muscles than humans do.', true),
    Data('In the original script of &quot;The Matrix&quot;, the machines used humans as additional computing power instead of batteries.', true),
    Data('Ewan McGregor did not know the name of the second prequel film of Star Wars during and after filming', true),
    Data('In the original Star Wars trilogy, David Prowse was the actor who physically portrayed Darth Vader.', true),//10
    Data('George Lucas directed the entire original Star Wars trilogy.', false )

  ];

//Metodos Getters para devolver y leer los atributos

  String get getQuestionText {
    return _questionList[_questionCount].question;
  }

  bool get getQuestionAnswer {
    return _questionList[_questionCount].answer;
  }

  int get getQuestionCount {
    return _questionCount;
  }
//Metodo para incrementar las preguntas
  void nextQuestion() {
    if (_questionCount < _questionList.length - 1) {
      _questionCount++;
    }
  }
}