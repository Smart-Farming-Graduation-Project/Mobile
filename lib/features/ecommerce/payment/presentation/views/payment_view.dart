import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crop_guard/core/helper/spacing.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardholderNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardholderNameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle payment logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Payment...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete your payment',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                verticalSpace(16),
                TextFormField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your card number';
                    }
                    if (value.replaceAll(' ', '').length < 16) {
                      return 'Card number must be 16 digits';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryDateController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter expiry date';
                          }
                          if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}\$')
                              .hasMatch(value)) {
                            return 'Invalid format';
                          }
                          return null;
                        },
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter CVV';
                          }
                          if (value.length < 3) {
                            return 'CVV must be 3 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                TextFormField(
                  controller: _cardholderNameController,
                  decoration: InputDecoration(
                    labelText: 'Cardholder Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter cardholder name';
                    }
                    return null;
                  },
                ),
                verticalSpace(24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text('Pay Now', style: TextStyle(fontSize: 16.sp)),
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
