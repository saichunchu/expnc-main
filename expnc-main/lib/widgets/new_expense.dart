import 'package:flutter/material.dart';
import 'package:expnc/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  // void _saveTitle(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  final _titleController = TextEditingController();
  final _numberController = TextEditingController();
  DateTime? _selectedDate;

  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpense() {
    final enteredAmount = double.tryParse(_numberController.text);
    final amountIsInvalid = (enteredAmount == null) || (enteredAmount <= 0);
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text('please Enter valid Data'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("okay"))
            ],
          );
        },
      );
      return;
    }
    widget.onAddExpense(Expense(
        amount: enteredAmount,
        title: _titleController.text,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Input Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 91, 247),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Amount Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _numberController,
              maxLength: 20,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                labelText: "Amount",
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Date Picker Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: _presentDatePicker, // Function to show the date picker
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : formatter.format(_selectedDate!),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  child: DropdownButtonFormField<Category>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Remove default border
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueAccent,
                    ),
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value == null) return;
                        _selectedCategory = value;
                      });
                    },
                    dropdownColor:
                        Colors.white, // Background color of the dropdown
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Buttons: Cancel and Submit
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _submitExpense,
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
