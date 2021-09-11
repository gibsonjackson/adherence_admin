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

class DoctorModel {
  String _name;
  String _email;
  String _designation;
  String _phone;
  String _clinic;
  String _startTime;
  String _endTime;
  ROLES _role;

  DoctorModel({
    @required String name,
    @required String email,
    @required String designation,
    @required String phone,
    @required String clinic,
    @required String startTime,
    @required String endTime,
    @required ROLES role,
  }) {
    this._name = name;
    this._email = email;
    this._designation = designation;
    this._phone = phone;
    this._clinic = clinic;
    this._startTime = startTime;
    this._endTime = endTime;
    this._role = role;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get designation => _designation;
  set designation(String designation) => _designation = designation;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get clinic => _clinic;
  set clinic(String clinic) => _clinic = clinic;
  String get startTime => _startTime;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime;
  set endTime(String endTime) => _endTime = endTime;
  ROLES get role => _role;
  set role(ROLES role) => _role = role;

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['designation'] = this._designation;
    data['phone'] = this._phone;
    data['role'] = Utils().getRole(this._role);
    return data;
  }

  Map<String, dynamic> toDoctorJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['designation'] = this._designation;
    data['phone'] = this._phone;
    data['clinic'] = this._clinic;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['role'] = Utils().getRole(this._role);
    return data;
  }

  DoctorModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _designation = json['designation'];
    _phone = json['phone'];
    _clinic = json['clinic'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
  }

  DoctorModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromJson(snapshot.data());
}
