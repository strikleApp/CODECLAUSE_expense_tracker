import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/modals/expense.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  User getCurrentUser() => auth.currentUser!;

  List<Expense> getItems(QuerySnapshot snapshot) {
    List<Expense> expenses = [];
    for (var doc in snapshot.docs.reversed) {
      Expense expense = Expense.fromJson(doc.data() as Map<String, dynamic>);
      expenses.add(expense);
    }
    return expenses;
  }

  Future<void> addItemToFirebase({required Expense expense}) async {
    await firestore
        .collection(getCurrentUser().uid.toString())
        .add(expense.toMap());
  }

  Future<void> deleteItemFromFirebase({required Expense expense}) async {
    CollectionReference collectionReference =
        firestore.collection(getCurrentUser().uid.toString());

    QuerySnapshot querySnapshot =
        await collectionReference.where("id", isEqualTo: expense.id).get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
