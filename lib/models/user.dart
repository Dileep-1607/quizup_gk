
class User{
  String
     userId,
      name,
      email,
      phone,
      points,
      money;

  User({
    this.userId='',
    this.name='',
    required this.email,
    this.phone='',
    this.points='',
    this.money='',
  });
  factory User.fromJson(Map<String,dynamic> json){
    return User(

        userId:json['userId'].toString(),
        name:json['name'].toString(),
        email:json['email'].toString(),
        phone:json['phone'].toString(),
        points: json['points'].toString(),
        money:json['money'].toString(),

    );
  }
  factory User.fromMap(Map<String,dynamic>json){
    return User(
        userId:json['userId'].toString(),
        name: json['name'].toString(),
        email: json['email'].toString(),
        phone: json['phone'].toString(),
        points: json['points'].toString(),
        money:json['money'].toString(),

    );
  }

  Map<String, dynamic> toMap()=>{
    "userId":userId,
    "name":name,
    "email":email,
    "phone":phone,
    "points":points,
    "money":money,
  };

}