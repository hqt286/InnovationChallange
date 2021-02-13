import 'package:flutter/material.dart';
import 'package:inspection_app/inspection/inspectionForm.dart';
import 'package:inspection_app/camera/camera_page.dart';
// amplify imports
import 'amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

void main() {
  runApp(MaterialApp(
    title: 'Inspection',
    // home: InspectionApp(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  String _uploadFileResult = '';
  String _getUrlResult = '';
  String _removeResult = '';

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    // Plugins
    Amplify.addPlugin(AmplifyAuthCognito());
    Amplify.addPlugin(AmplifyStorageS3());

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobile Inspection App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InspectionApp());
  }
}
