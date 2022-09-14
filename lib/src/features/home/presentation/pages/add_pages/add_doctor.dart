import 'package:adherence_admin/src/features/auth/data/repositories/login_repo.dart';
import 'package:adherence_admin/src/features/home/data/datasources/firebase_home_provider.dart';
import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/utils/my_function.dart';
import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class AddDoctor extends StatefulWidget {
  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  final _doctorFormKey = GlobalKey<FormState>();
  final values = List.filled(7, false);

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _timeController = TextEditingController(),
      _nameController = TextEditingController(),
      _desController = TextEditingController(),
      _phoneController = TextEditingController(),
      _clinicController = TextEditingController(),
      _emailController = TextEditingController();
  String startTime = "9:00 AM", endTime = "5:00 PM";

  bool isLoading = false;

  validateForm(BuildContext context) async {
    if (!isLoading) {
      if (_doctorFormKey.currentState.validate()) {
        FirebaseHomeProvider firebaseHomeProvider = FirebaseHomeProvider();
        String password = MyFunctions().generatePassword();
        DoctorModel doctorModel = DoctorModel(
          name: _nameController.text,
          email: _emailController.text,
          designation: _desController.text,
          phone: _phoneController.text,
          clinic: _clinicController.text,
          startTime: startTime,
          endTime: endTime,
          password: password,
          role: ROLES.PRACTITIONER,
        );
        setState(() {
          isLoading = true;
        });
        await firebaseHomeProvider.addUser(doctorModel.toUserJson());
        await LoginRepo()
            .registerWithEmailPassword(_emailController.text, password);
        await firebaseHomeProvider
            .addDoctor(doctorModel.toDoctorJson())
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Doctor Added Successfully!',
              ),
              backgroundColor: successColor,
            ),
          );
          Navigator.of(context).pop();
        });

        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setTimetoVariable(TimeOfDay time) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay = localizations.formatTimeOfDay(time);
      return formattedTimeOfDay;
    }

    Future<Null> _selectTime(BuildContext context, bool isStartTime) async {
      final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (picked != null)
        setState(() {
          selectedTime = picked;
          if (isStartTime) {
            startTime = setTimetoVariable(selectedTime);
          } else {
            endTime = setTimetoVariable(selectedTime);
          }
        });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Doctor"),
        actions: [
          TextButton(
            child: Text(
              "ADD",
              style: TextStyle(color: white),
            ),
            onPressed: () => validateForm(context),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Form(
                  key: _doctorFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyFormField(
                        title: "Enter Name",
                        controller: _nameController,
                      ),
                      MyFormField(
                        title: "Enter Email",
                        isEmail: true,
                        controller: _emailController,
                      ),
                      MyFormField(
                        title: "Enter Phone",
                        isPhone: true,
                        controller: _phoneController,
                      ),
                      MyFormField(
                        title: "Enter Designation",
                        controller: _desController,
                      ),
                      MyFormField(
                        title: "Enter Clinic",
                        isNullable: true,
                        controller: _clinicController,
                      ),
                      //FIXME
                      // Text(
                      //   "Select days of availability",
                      //   style: Theme.of(context).textTheme.headline6.copyWith(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 16,
                      //       ),
                      // ),
                      // SizedBox(height: 5),
                      // WeekdaySelector(
                      //   selectedFillColor: accentColor,
                      //   onChanged: (v) {
                      //     setState(() {
                      //       values[v % 7] = !values[v % 7];
                      //     });
                      //   },
                      //   values: values,
                      // ),
                      // SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Select Start Time",
                      //       style:
                      //           Theme.of(context).textTheme.headline6.copyWith(
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 14,
                      //               ),
                      //     ),
                      //     InkWell(
                      //       onTap: () => _selectTime(context, true),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           color: lightGrey,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10)),
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               vertical: 5, horizontal: 10),
                      //           child: Text(
                      //             startTime,
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .headline6
                      //                 .copyWith(
                      //                   fontSize: 14,
                      //                 ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Select End Time",
                      //       style:
                      //           Theme.of(context).textTheme.headline6.copyWith(
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 14,
                      //               ),
                      //     ),
                      //     InkWell(
                      //       onTap: () => _selectTime(context, false),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           color: lightGrey,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10)),
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               vertical: 5, horizontal: 10),
                      //           child: Text(
                      //             endTime,
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .headline6
                      //                 .copyWith(
                      //                   fontSize: 14,
                      //                 ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      // phone designation weeks time place
                      MyButton(
                        foo: () => validateForm(context),
                        title: "Add Doctor",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class MyFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isNullable;
  final bool isEmail;
  final bool isPhone;

  const MyFormField(
      {Key key,
      this.title,
      this.controller,
      this.isNullable = false,
      this.isEmail = false,
      this.isPhone = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        textCapitalization:
            isEmail ? TextCapitalization.none : TextCapitalization.words,
        decoration: InputDecoration(
          isDense: true,
          labelText: title,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide(
              color: accentColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide(
              color: grey,
            ),
          ),
        ),
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isPhone
                ? TextInputType.phone
                : TextInputType.text,
        validator: (value) {
          if (!isNullable) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be left empty';
            }
          }

          return null;
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function foo;
  final String title;

  const MyButton({
    Key key,
    @required this.foo,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            onPressed: foo,
            child: Text(title),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
