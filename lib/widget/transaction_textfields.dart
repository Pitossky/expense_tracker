import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTextfield extends StatefulWidget {
  late final Function addTransactionFunction;
  TransactionTextfield({required this.addTransactionFunction});

  @override
  State<TransactionTextfield> createState() => _TransactionTextfieldState();
}

class _TransactionTextfieldState extends State<TransactionTextfield> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransactionFunction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((dateValue) {
      if (dateValue == null) {
        return;
      }
      setState(() {
        _selectedDate = dateValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom * 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Transaction Title',
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Transaction Amount',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : 'Date Chosen: ${DateFormat.yMd().format(_selectedDate!)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
                      ),
                      //style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: _displayDatePicker,
                    child: const Text('Choose Date',
                        style: TextStyle(
                          fontSize: 19,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: submitTransaction,
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
