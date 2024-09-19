import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:feeding_application/shared/custom_input_field.dart';
import 'package:flutter/material.dart';

class RestaurantRegisterView extends StatefulWidget {
  const RestaurantRegisterView({super.key});

  @override
  State<RestaurantRegisterView> createState() => _RestaurantRegisterViewState();
}

class _RestaurantRegisterViewState extends State<RestaurantRegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _telephoneFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _submitFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocusNode.addListener(() {
      if (_confirmPasswordFocusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _addressFocusNode.dispose();
    _telephoneFocusNode.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _submitFocusNode.dispose();

    super.dispose();
  }

  //function for form sumbission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with the registration process
      final String name = _nameController.text.trim();
      final String address = _addressController.text.trim();
      final String telephone = _telephoneController.text.trim();
      final String userName = _userNameController.text.trim();
      final String password = _passwordController.text.trim();

      // You can now use these values to send to your backend or further processing.
      // For example, you could call an API or use a bloc event.

      print('Form Submitted Successfully');
      print('Name: $name');
      print('Address: $address');
      print('Telephone: $telephone');
      print('Username: $userName');
      print('Password: $password');

      // Show a success message or navigate to another screen.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: const Text('Registration Successful')),
      );

      // Clear the form if needed
      _formKey.currentState!.reset();
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
      appBar: AppBar(
        title: const Text('Restaurant Registration'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(controller: _scrollController, children: [
            CustomInputField(
              controller: _nameController,
              labelName: 'Name',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (value.length < 3) {
                  return 'Name should be at least 3 characters long';
                }
                return null;
              },
              focusNode: _nameFocusNode,
              nextFocusNode: _addressFocusNode,
              textInputType: TextInputType.name,
              hintText: 'Enter your name',
            ),
            CustomInputField(
              controller: _addressController,
              labelName: 'Address',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              focusNode: _addressFocusNode,
              nextFocusNode: _telephoneFocusNode,
              textInputType: TextInputType.streetAddress,
              hintText: 'Enter your address',
            ),
            CustomInputField(
              controller: _telephoneController,
              labelName: 'Telephone Number',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your telephone number';
                } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Enter a valid 10-digit telephone number';
                }
                return null;
              },
              focusNode: _telephoneFocusNode,
              nextFocusNode: _userNameFocusNode,
              textInputType: TextInputType.phone,
              hintText: 'Enter your telephone number',
            ),
            CustomInputField(
              controller: _userNameController,
              labelName: 'User Name',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                } else if (value.length < 4) {
                  return 'Username should be at least 4 characters long';
                }
                return null;
              },
              focusNode: _userNameFocusNode,
              nextFocusNode: _passwordFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Enter your username',
            ),
            CustomInputField(
              controller: _passwordController,
              labelName: 'Password',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 8) {
                  return 'Password should be at least 8 characters long';
                } else if (!RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
                    .hasMatch(value)) {
                  return 'Password should contain at least one uppercase letter, one lowercase letter, and one number';
                }
                return null;
              },
              focusNode: _passwordFocusNode,
              nextFocusNode: _confirmPasswordFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Enter a strong password',
              isPasswordField: true,
              isPasswordVisible: _isPasswordVisible,
              onTogglePasswordVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            CustomInputField(
              controller: _confirmPasswordController,
              labelName: 'Confirm Password',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              focusNode: _confirmPasswordFocusNode,
              nextFocusNode: _submitFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Re-type your password',
              isPasswordField: true,
              isPasswordVisible: _isConfirmPasswordVisible,
              onTogglePasswordVisibility: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                focusNode: _submitFocusNode,
                onPressed: _submitForm,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.slateGray),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
