import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class UpdateImage extends StatefulWidget {
  UpdateImage({Key key}) : super(key: key);

  @override
  _UpdateImageState createState() => _UpdateImageState();
}

class _UpdateImageState extends State<UpdateImage> {
  File _image;
  final picker = ImagePicker();
  String uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image.path);
      });
    }

    Future uploadImage(BuildContext context) async {
      String fileName = Path.basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask updateTask = firebaseStorageRef.putFile(_image);

      StorageTaskSnapshot taskSnapshort = await updateTask.onComplete;
      firebaseStorageRef.getDownloadURL().then((fileURL) {
        setState(() {
          uploadedFileURL = fileURL.toString();
          if (taskSnapshort != null) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Profile Picture Uploaded'),
            ));
          }
        });
      });
    }
  }
}
