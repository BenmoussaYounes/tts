import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
        BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text), backgroundColor: Colors.green.shade400));

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showFailureSnackBar(
        BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text), backgroundColor: Colors.red.shade400));
