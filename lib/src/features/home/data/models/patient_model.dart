import 'package:adherence_admin/src/utils/res/my_enums.dart';
import 'package:adherence_admin/src/utils/res/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  String _name;
  String _email;
  String _phone;
  String _doctor;
  String _password;
  String _parent;
  ROLES _role;

  PatientModel(
      {String name, String email, String phone, String doctor, String password, ROLES role,String parent}) {
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._role = role;
    this._parent = parent;
    this._doctor = doctor;
    this._password = password;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get doctor => _doctor;
  set doctor(String doctor) => _doctor = doctor;
  String get password => _password;
  set parent(String parent) => _parent = parent;
  String get parent => _parent;
  set password(String password) => _password = password;
  ROLES get role => _role;
  set role(ROLES role) => _role = role;

  PatientModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _doctor = json["doctor"];
    _password = json['password'];
    _parent = json['parent'];
  }

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['password'] = this._password;
    data['doctor'] = this._doctor;
    data['parent'] = this._parent;
    data['designation'] = "";
    data['role'] = Utils().getRole(this._role);
    return data;
  }

  Map<String, dynamic> toPatientJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['password'] = this._password;
    data['doctor'] = this._doctor;
    data['parent'] = this._parent;
    data['role'] = Utils().getRole(this._role);
    return data;
  }

  PatientModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromJson(snapshot.data());
}
