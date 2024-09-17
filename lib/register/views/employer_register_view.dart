import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class EmployerRegisterView extends StatefulWidget {
  const EmployerRegisterView({super.key});

  @override
  State<EmployerRegisterView> createState() => _EmployerRegisterViewState();
}

class _EmployerRegisterViewState extends State<EmployerRegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _nicFocusNode = FocusNode();
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
    _nicFocusNode.dispose();
    _telephoneFocusNode.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _submitFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employer Registration'),
      ),
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
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _addressFocusNode,
              nextFocusNode: _nicFocusNode,
              textInputType: TextInputType.streetAddress,
              hintText: 'Enter your address',
            ),
            CustomInputField(
              controller: _nicController,
              labelName: 'NIC',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _nicFocusNode,
              nextFocusNode: _telephoneFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Enter your NIC number',
            ),
            CustomInputField(
              controller: _telephoneController,
              labelName: 'Telephone Number',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _telephoneFocusNode,
              nextFocusNode: _userNameFocusNode,
              textInputType: TextInputType.phone,
              hintText: 'Enter your Telephone Number',
            ),
            CustomInputField(
              controller: _userNameController,
              labelName: 'User Name',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _userNameFocusNode,
              nextFocusNode: _passwordFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Enter your User Name',
            ),
            CustomInputField(
              controller: _passwordController,
              labelName: 'Password',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _passwordFocusNode,
              nextFocusNode: _confirmPasswordFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Enter a Strong Password',
            ),
            CustomInputField(
              controller: _confirmPasswordController,
              labelName: 'Confirm Password',
              validatorFucntion: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              focusNode: _confirmPasswordFocusNode,
              nextFocusNode: _submitFocusNode,
              textInputType: TextInputType.text,
              hintText: 'Re-Type your password',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                focusNode: _submitFocusNode,
                onPressed: () {},
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

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.controller,
      required this.labelName,
      this.validatorFucntion,
      this.hintText,
      this.focusNode,
      this.textInputType,
      this.nextFocusNode});

  final TextEditingController controller;
  final String labelName;
  final String? Function(String?)? validatorFucntion;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? textInputType;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              labelName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.deepBlue),
            ),
          ),
          TextFormField(
              controller: controller,
              validator: validatorFucntion,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
              ),
              onTapOutside: (event) {
                if (focusNode != null) {
                  focusNode!.unfocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: textInputType,
              onEditingComplete: () {
                if (nextFocusNode != null) {
                  FocusScope.of(context).requestFocus(nextFocusNode);
                } else {
                  FocusScope.of(context).unfocus();
                }
              }),
        ],
      ),
    );
  }
}
