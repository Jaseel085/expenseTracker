import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/core/failour.dart';
import 'package:expense_tracker/core/core/type_def.dart';
import 'package:expense_tracker/models/expenseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/core/firbase_constants.dart';
import '../../core/providers/firbase_providers.dart';

final repositoryprovider = Provider((ref) {
  return ExpenseRepository(firestore: ref.watch(fireStoreProvider)) ;
});

class ExpenseRepository{
  final FirebaseFirestore _firestore;

  ExpenseRepository({
    required FirebaseFirestore firestore
}):_firestore=firestore;

FutureVoid uploadExpense(Expensemodel expenseModel)async {
  try{
    return right(
        _expense.add(expenseModel.toMap()));
  }on FirebaseException catch (e){
    throw e.message!;
  }catch (e){
    return left(Failure(e.toString()));

  }
}

CollectionReference get _expense=>
    _firestore.collection(FirebaseConstants.expense);
}