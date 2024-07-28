import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
    
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Add Expense',
               style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
              ),
             const SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              child: TextFormField(
                controller: expenseController,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefix:const Icon(FontAwesomeIcons.moneyBill,
                    size: 16,
                    color: Colors.grey,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
            ) , 
            const SizedBox(height: 30,),
            TextFormField(
              controller: categoryController,
               decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefix:const Icon(FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey,),
                    hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
            )  ,
            const SizedBox(height: 16,),
            TextFormField(
              controller: dateController,
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),

                   );
              },
              decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefix:const Icon(FontAwesomeIcons.clock,
                    size: 16,
                    color: Colors.grey,),
                    hintText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
            ),
             const SizedBox(height: 17,),
            SizedBox(
              width: double.infinity,
              height: kToolbarHeight,
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: const Text('Save',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),)),
            )
            ],),
        ),
      ),
    );
  }
}