class QuestionModel {
  QuestionModel({required this.flagUrl, required this.options});

  String flagUrl;
  List<String> options;

  List<String> get suffledAnswer {
    var suffledList = List.of(options);
    suffledList.shuffle();
    return suffledList;
  }
}
