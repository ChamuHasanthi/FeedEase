import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:feeding_application/shared/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RequestView extends StatefulWidget {
  const RequestView({Key? key}) : super(key: key);

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController restaurantIdController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final FocusNode restaurantNode = FocusNode();
  final FocusNode quantityNode = FocusNode();

  // Create a reference to the Firebase Realtime Database
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('requests');

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String restaurant = restaurantIdController.text.trim();
      final String quantity = quantityController.text.trim();

      // Push data to Firebase Realtime Database
      databaseRef.push().set({
        'restaurant': restaurant,
        'quantity': quantity,
      }).then((_) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Request Successful')),
        );

        // Clear the form
        _formKey.currentState!.reset();
      }).catchError((error) {
        // Handle errors here if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit request: $error')),
        );
      });
    } else {
      // Form is invalid, show error messages
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Make a request',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.midnightBlue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInputField(
                  controller: restaurantIdController,
                  labelName: 'Restaurant name',
                  hintText: 'Enter restaurant name',
                  focusNode: restaurantNode,
                  nextFocusNode: quantityNode,
                  validatorFucntion: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter restaurant name';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: quantityController,
                  labelName: 'Quantity',
                  hintText: 'Enter quantity',
                  focusNode: quantityNode,
                  textInputType: TextInputType.number,
                  validatorFucntion: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quantity';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: const ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(AppColors.slateGray),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Confirm',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
