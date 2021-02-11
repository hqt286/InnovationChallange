import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
// import './storage/storage_service.dart';

// amplify imports
import 'amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

void main() {
  runApp(MyApp());
}

// 1
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  String _uploadFileResult = '';
  String _getUrlResult = '';
  String _removeResult = '';

  AmplifyStorageS3 storage = new AmplifyStorageS3();

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

  void _upload() async {
    try {
      print('In upload');
      // File local = await FilePicker.getFile(type: FileType.any);
      FilePickerResult result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);
      if (result != null) {
        File local = File(result.files.first.path);
        final key = 'ExampleKey';
        Map<String, String> metadata = <String, String>{};
        metadata['name'] = 'WE DID IT FAM!';
        metadata['desc'] = 'A successfully uploaded photo';
        S3UploadFileOptions options = S3UploadFileOptions(
            accessLevel: StorageAccessLevel.guest, metadata: metadata);
        UploadFileResult file_result = await Amplify.Storage.uploadFile(
            key: key, local: local, options: options);
        setState(() {
          _uploadFileResult = file_result.key;
        });
      }
    } catch (e) {
      print('UploadFile Err: ' + e.toString());
    }
  }

  void getUrl() async {}

  void _download() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobile Inspection App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Amplify App'),
            ),
            //   body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
            //     Center(
            //       child: Column(children: [
            //         const Padding(padding: EdgeInsets.all(5.0)),
            //         Text(_amplifyConfigured
            //             ? "AWS Amplify configured!"
            //             : "not configured"),
            //         // const Padding(padding: EdgeInsets.all(5.0)),
            //         // Text('hi'),
            //       ]),
            //     )
            //   ]),
            // ));
            // body: TableLayout(),
            // body: MyCustomForm(),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: _upload,
                  child: const Text('Upload File'),
                ),
              ],
            ))));
  }
}
