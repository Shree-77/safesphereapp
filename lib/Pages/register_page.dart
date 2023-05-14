import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

//Services

import '../Services/media_service.dart';
import '../Services/cloud_services.dart';
import '../Services/database_services.dart';

//Widgets

import '../widgets/custom_input_field.dart';
import '../widgets/rounded_button.dart';

//Providers
import '../Providers/authentication_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold();
  }
}
