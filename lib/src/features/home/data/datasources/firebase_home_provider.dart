import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHomeProvider {
  final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  Future<void> addUser(Map<dynamic, dynamic> userMap) async {
    DocumentReference ref =
        await databaseReference.collection("users").add(userMap);
    print(ref.id);
  }

  Future<void> addDoctor(Map<dynamic, dynamic> doctorMap) async {
    DocumentReference ref =
        await databaseReference.collection("doctors").add(doctorMap);
    print(ref.id);
  }
  Future<void> addParent(Map<dynamic, dynamic> doctorMap) async {
    DocumentReference ref =
    await databaseReference.collection("parents").add(doctorMap);
    print(ref.id);
  }

  Future<void> addPatient(Map<dynamic, dynamic> patientMap) async {
    DocumentReference ref =
        await databaseReference.collection("patients").add(patientMap);
    print(ref.id);
  }

  Future<void> addDoctorToPatient(
      String patientEmail, String doctorEmail) async {
    print("aaa");
    await databaseReference
        .collection('patients')
        .where('email', isEqualTo: patientEmail)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .doc(f.id)
            .update({"doctor": doctorEmail});
      });
    });
  }
  Future<void> addParentToPatient(
      String patientEmail, String parentEmail) async {
    print("aaa");
    await databaseReference
        .collection('patients')
        .where('email', isEqualTo: patientEmail)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {
        print(f.data);
        databaseReference
            .collection('patients')
            .doc(f.id)
            .update({"parent": parentEmail});
      });
    });
  }

  // void getData() {
  //   databaseReference.collection("books").get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((f) => print('${f.data}}'));
  //   });
  // }

  // void updateData() {
  //   try {
  //     databaseReference
  //         .collection('books')
  //         .doc('1')
  //         .update({'description': 'Head First Flutter'});
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // void deleteData() {
  //   try {
  //     databaseReference.collection('books').doc('1').delete();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
