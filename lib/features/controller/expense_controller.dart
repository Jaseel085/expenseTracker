import 'package:expense_tracker/features/repository/expense_repository.dart';
import 'package:expense_tracker/models/expenseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseControllerProvider = StateNotifierProvider<ExpenseController,bool >((ref) {
  return ExpenseController(
      repository: ref.watch(repositoryprovider),
      ref: ref);

});

final getallExpense = StreamProvider((ref) {
  final expenseController = ref.watch(expenseControllerProvider.notifier);
  return expenseController.showExpense();
});


class ExpenseController extends StateNotifier<bool>{
  final ExpenseRepository _repository;
  final Ref _ref;
  ExpenseController({
    required ExpenseRepository repository,
    required Ref ref
}):_repository=repository,_ref=ref,super(false);


  Future uploadExpence(Expensemodel expenseModel){
    return _repository.uploadExpense(expenseModel);
  }

  Stream<List<Expensemodel>> showExpense(){
    return _repository.showExpense();
  }

}