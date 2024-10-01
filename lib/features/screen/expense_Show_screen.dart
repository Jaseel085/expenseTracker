import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/core/commen/error.dart';
import 'package:expense_tracker/core/core/commen/loader.dart';
import 'package:expense_tracker/features/controller/expense_controller.dart';
import 'package:expense_tracker/models/expenseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class ExpenseShowScreen extends ConsumerStatefulWidget {
  const ExpenseShowScreen({super.key});

  @override
  ConsumerState createState() => _ExpenseShowScreenState();
}

class _ExpenseShowScreenState extends ConsumerState<ExpenseShowScreen> {

  final expenseNameController=TextEditingController();
  final expenseAmountController=TextEditingController();
  final formkey=GlobalKey<FormState>();


  List totals=[];
  var sum=0;
  double total=0;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Your Expenses",
            style: TextStyle(
              color: Colors.white,
              fontSize: wi * 0.06,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: wi*0.3,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: expenseNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(wi*0.03),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(wi*0.03),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )
                          ),
                          hintText: "Enter expense name",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5)
                          ),
                          labelText: "Expense name",
                            labelStyle: TextStyle(
                                color: Colors.teal
                            )
            
                        ),
                      ),
                      SizedBox(height: wi*0.04,),
                      TextFormField(
                        controller: expenseAmountController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(wi*0.03),
                            borderSide: const BorderSide(
                              color: Colors.teal,
                            )
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(wi*0.03),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                              )
                          ),
                          hintText: "Enter expense amount",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5)
                          ),
                          labelText: "Expense amount",
                          labelStyle: TextStyle(
                            color: Colors.teal
                          )
            
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: wi*0.1,),
                InkWell(
                  onTap: () {
                    if(
                    expenseNameController.text!=""&&
                    expenseAmountController.text!=""
                    ){
                      Expensemodel expenseModel =Expensemodel(
                          name: expenseNameController.text,
                          expense: double.tryParse(expenseAmountController.text));
                      ref.watch(expenseControllerProvider.notifier).uploadExpence(expenseModel);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Data Added SuccessFully"),));
                      expenseNameController.clear();
                      expenseAmountController.clear();
                    }else{
                      expenseNameController.text.isEmpty?
                      ScaffoldMessenger.of(context).
                      showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Please Enter Expense Name"))):

                      ScaffoldMessenger.of(context).
                      showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Please Enter Expense amount")));
                    }
                  },
                  child: Container(
                    height: wi*0.15,
                    width: wi*0.4,
                     decoration: BoxDecoration(
                       color: Colors.teal,
                       borderRadius: BorderRadius.circular(wi*0.03)
                     ),
                    child: Center(
                      child: Text(
                        "Add Expense",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: wi*0.04,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: wi*0.1,),
                const Divider(
                  color: Colors.teal,
                ),
                const Text("Expenses",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: wi*0.05,),
                ref.watch(getallExpense).when(
                    data: (expense) {

                      total=0;
                      for(int i=0;i<expense.length;i++){
                        total=total+expense[i].expense!.toDouble();
                      }
                      return
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: wi*0.5,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: expense.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(wi*0.03)
                                  ),
                                  width: wi*1,
                                  height: wi*0.15,
                                  child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(expense[index].name.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text(expense[index].expense.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: wi*0.03,);
                              },
                            ),
                          ),
                        ),
                      );
                    }

                    ,


                    error: (error, stackTrace) => ErrorText(error: error.toString()),
                    loading:()=> Loader()
                ),
                Container(
                  height: wi*0.11,
                  width: wi*1,
                  color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text("Total Expence:${total}0",style: TextStyle(
                          color: Colors.white,
                          fontSize: wi*0.05,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
