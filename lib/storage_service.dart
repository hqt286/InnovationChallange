import 'dart:async';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class StorageService {
  // 1
  final imageUrlsController = StreamController<List<String>>();
  // AmplifyStorageS3 storage = new AmplifyStorageS3();

  // 2
  void getImages() async {
    print('Getting list of images');
    try {
      // 3
      S3ListOptions listOptions =
          S3ListOptions(accessLevel: StorageAccessLevel.guest);
      // 4
      print('Getting result');
      ListResult result =
          await Amplify.Storage.list(path: '', options: listOptions);

      // 5
      final getUrlOptions =
          GetUrlOptions(accessLevel: StorageAccessLevel.guest);
      // 6
      final List<String> imageUrls =
          await Future.wait(result.items.map((item) async {
        final urlResult =
            await Amplify.Storage.getUrl(key: item.key, options: getUrlOptions);
        return urlResult.url;
      }));
      print(imageUrls);

      // 7
      imageUrlsController.add(imageUrls);

      // 8
    } catch (e) {
      print('Storage List error - $e');
    }
  }

  void uploadImageAtPath(String imagePath) async {
    print('In upload');
    File local = File(imagePath);
    print("local file path - $local");
    // final imageKey = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final x = (await local.readAsBytes()).length;
    print('image size - $x');
    final imageKey = new DateTime.now().toString();
    print("image key - $imageKey");
    Map<String, String> metadata = <String, String>{};
    metadata['name'] = 'WE DID IT FAM!';
    metadata['desc'] = 'A successfully uploaded photo';
    S3UploadFileOptions options = S3UploadFileOptions(
        accessLevel: StorageAccessLevel.guest,
        contentType: '',
        metadata: metadata);
    print("option - $options");
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
          key: imageKey, local: local, options: options);
    } on StorageException catch (e) {
      print(e.message);
    }
    // } catch (e) {
    //   print('upload error - $e');
  }
}
