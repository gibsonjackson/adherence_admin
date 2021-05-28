import 'package:adherence_admin/src/utils/res/colors.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 15),
          ListTile(
            title: Text("Aayush Jain"),
            subtitle: Text("Psychologist"),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ],
            ),
            minLeadingWidth: 0,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Availablity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Mon-Wed, 9-5",
                  style: TextStyle(
                    color: grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
