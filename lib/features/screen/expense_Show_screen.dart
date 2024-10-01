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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
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
        body: Padding(
          padding:  EdgeInsets.all(wi*0.04),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: wi*0.3,),
                  TextFormField(
                    controller: expenseNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(wi*0.03),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        )
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(wi*0.03),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          )
                      ),
                      hintText: "Enter expense name",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5)
                      ),
                      labelText: "Expense name",
              
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
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        )
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(wi*0.03),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          )
                      ),
                      hintText: "Enter expense amount",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5)
                      ),
                      labelText: "Expense amount",
              
                    ),
                  ),
                  SizedBox(height: wi*0.1,),
                  InkWell(
                    onTap: () {
                      if(
                      expenseNameController!=""&&
                      expenseAmountController!=""
                      ){
                        print("object1");
                      }else{
                        print("object");
                        ScaffoldMessenger.of(context).
                        showSnackBar(SnackBar(content: Text("Please Enter Expense Name")));
                      }
                    },
                    child: Container(
                      height: wi*0.15,
                      width: wi*0.4,
                       decoration: BoxDecoration(
                         color: Colors.deepPurple,
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
                  Divider(
                    color: Colors.deepPurple,
                  ),
                  const Text("Expenses",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: wi*0.05,),
                  Container(
                    height: wi*1,
                    child: Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(wi*0.03)
                            ),
                            width: wi*1,
                              height: wi*0.15,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: wi*0.03,);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
