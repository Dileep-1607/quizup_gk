
class Question{
  String
     mainCategory,
     question,
     answer,
     questionId,
     category,
      explanation;
  List options;

  Question({
    this.mainCategory='',
    this.question='',
    this.answer='',
     this.questionId='',
    this.category='',
    this.explanation='',
    this.options=const[],
  });
  factory Question.fromJson(Map<String,dynamic> json){
    return Question(
        mainCategory: json['mainCategory']??[],
        question:json['question'].toString(),
        answer:json['answer'].toString(),
        questionId:json['questionId'].toString(),
        category:json['category'].toString(),
        explanation:json['explanation'].toString(),
        options:json['options']??[],

    );
  }
  factory Question.fromMap(Map<String,dynamic>json){
    return Question(
        mainCategory: json['mainCategory']??[],
        question:json['question'].toString(),
        answer:json['answer'].toString(),
        questionId:json['questionId'].toString(),
        category:json['category'].toString(),
        explanation:json['explanation'].toString(),
        options:json['options']??[]

    );
  }
  Map<String, dynamic> toMap()=>{
    "mainCategory":mainCategory,
    "question":question,
    "answer":answer,
    "questionId":questionId,
    "category":category,
    "explanation":explanation,
    "options": options,
  };
}