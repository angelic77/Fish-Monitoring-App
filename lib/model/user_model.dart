class UserModel {
  String? uid = null;
  String? email = null;
  String? firstName = null;
  String? lastName = null;
  String? age = null;
  String? address = null;
  String? occupation = null;
  String? phonenumber = null;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.age,
    this.address,
    this.occupation,
    this.phonenumber,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      address: map['address'],
      occupation: map['occupation'],
      phonenumber: map['phonenumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'address': address,
      'occupation': occupation,
      'phonenumber': phonenumber,
    };
  }
}
