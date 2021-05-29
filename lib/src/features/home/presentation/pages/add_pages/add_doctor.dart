import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class AddDoctor extends StatefulWidget {
  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  final _formKey = GlobalKey<FormState>();
  final values = List.filled(7, false);

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _timeController = TextEditingController();
  String startTime = "9:00 AM", endTime = "5:00 PM";

  validateForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formField(title: "Enter Name"),
                _formField(
                  title: "Enter Email",
                  isEmail: true,
                ),
                _formField(
                  title: "Enter Phone",
                  isPhone: true,
                ),
                _formField(
                  title: "Enter Designation",
                ),
                _formField(
                  title: "Enter Clinic",
                  isNullable: true,
                ),
                Text(
                  "Select days of availability",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: 5),
                WeekdaySelector(
                  selectedFillColor: accentColor,
                  onChanged: (v) {
                    setState(() {
                      values[v % 7] = !values[v % 7];
                    });
                  },
                  values: values,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Start Time",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                    ),
                    InkWell(
                      onTap: () => _selectTime(context, true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(
                            startTime,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontSize: 14,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select End Time",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                    ),
                    InkWell(
                      onTap: () => _selectTime(context, false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(
                            endTime,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontSize: 14,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // phone designation weeks time place
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
                    onPressed: () => validateForm(context),
                    child: Text('Add Doctor'),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formField({
    @required String title,
    bool isNullable = false,
    bool isEmail = false,
    bool isPhone = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
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
