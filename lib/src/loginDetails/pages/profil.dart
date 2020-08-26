import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/models/user.dart';
import 'package:news/src/appBar/my_app_bar.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  //final AuthService _auth = AuthService();

  File _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    Future getImage() async {
      var image = await picker.getImage(source: ImageSource.camera);
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
      setState(() {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Profile Picture Uploaded'),
        ));
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white12, width: 10),
                              ),
                              child: CircleAvatar(
                                radius: 120,
                                backgroundColor: Colors.white12,
                                foregroundColor: Colors.red,
                                backgroundImage: (_image != null)
                                    ? FileImage(_image)
                                    : NetworkImage(
                                        'https://images.unsplash.com/photo-1504567961542-e24d9439a724?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80',
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                splashRadius: 0.1,
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                onPressed: () {
                                  getImage();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name : ',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  '${user.name}',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'User ID : ',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  '${user.email}',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 40),
                RaisedButton.icon(
                  color: Colors.black,
                  onPressed: () {
                    uploadImage(context);
                  },
                  icon: Icon(
                    Icons.save,
                    color: Colors.orange,
                    size: 40,
                  ),
                  label: Text(
                    'Save',
                    style: TextStyle(color: Colors.green, fontSize: 40),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Profil extends StatefulWidget {

//   const Profil({Key key}) : super(key: key);

//   @override
//   _ProfilState createState() => _ProfilState();
// }

// class _ProfilState extends State<Profil> {
//   File _image;

//   String _uploadedFileURL;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore File Upload'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text('Selected Image'),
//             _image != null
//                 ? Image.asset(
//                     _image.path,
//                     height: 150,
//                   )
//                 : Container(height: 150),
//             _image == null
//                 ? RaisedButton(
//                     child: Text('Choose File'),
//                     onPressed: chooseFile,
//                     color: Colors.cyan,
//                   )
//                 : Container(),
//             _image != null
//                 ? RaisedButton(
//                     child: Text('Upload File'),
//                     onPressed: uploadFile,
//                     color: Colors.cyan,
//                   )
//                 : Container(),
//             _image != null
//                 ? RaisedButton(
//                     child: Text('Clear Selection'),
//                     onPressed: clearSelection,
//                   )
//                 : Container(),
//             Text('Uploaded Image'),
//             _uploadedFileURL != null
//                 ? Image.network(
//                     _uploadedFileURL,
//                     height: 150,
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }

//   Future chooseFile() async {
//    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
//      setState(() {
//        _image = image;
//      });
//    });
//  }

//  Future uploadFile() async {
//    StorageReference storageReference = FirebaseStorage.instance
//        .ref()
//        .child('chats/${Path.basename(_image.path)}}');
//    StorageUploadTask uploadTask = storageReference.putFile(_image);
//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//      });
//    });
//  }
// }
