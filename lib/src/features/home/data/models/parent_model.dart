import 'package:adherence_admin/src/utils/res/my_enums.dart';
import 'package:adherence_admin/src/utils/res/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/**
 *
 *  {
    "name": "endTime",
    "email": "aaa",
    "designation": "aaa",
    "phone": "aaa",
    "clinic": "aaa",
    "startTime": "aa",
    "endTime": "aa"
    }
 */

class ParentModel {
  String _name;
  String _email;
  String _phone;
  String _password;

  ParentModel({
    @required String name,
    @required String email,
    @required String phone,
    @required String password,
  }) {
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._password = password;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get password => _password;
  set password(String password) => _password = password;

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['password'] = this._password;
    return data;
  }

  Map<String, dynamic> toDoctorJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['password'] = this._password;
    return data;
  }

  ParentModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
  }
  List<ParentModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return ParentModel(
          name: dataMap['name'],
          email: dataMap['email'],
          phone: dataMap['phone'],
          password: dataMap['password']);
    }).toList();
  }

  ParentModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromJson(snapshot.data());
}
