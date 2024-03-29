class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({this.uid, this.email, this.firstName, this.lastName});

  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
    }
  }
