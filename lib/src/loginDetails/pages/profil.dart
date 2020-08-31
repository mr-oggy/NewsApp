import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/models/user.dart';
import 'package:news/src/appBar/my_app_bar.dart';
import 'package:news/src/loginDetails/pages/settingPage.dart';
import 'package:news/src/loginDetails/services/auth.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final AuthService _auth = AuthService();
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

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
      String photoUrl = await firebaseStorageRef.getDownloadURL();
      await _auth.getCurrentUser().updateProfile(photoURL: photoUrl);
      setState(() async {
        if (taskSnapshort != null) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Profile Picture Uploaded'),
          ));
        }
      });
    }

    print(_auth.getCurrentUser().displayName);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.only(right: 16),
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: IconButton(
                      splashColor: Colors.transparent,
                      splashRadius: 0.1,
                      icon: Icon(
                        Icons.settings,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingPage()));
                      }),
                ),
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
                                    : CachedNetworkImageProvider(
                                        _auth.getCurrentUser().photoURL ?? '',
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
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    ),
                  ),
                ),
                Text(
                  '${user.name}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'User ID : ',
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    ),
                  ),
                ),
                Text(
                  '${user.email}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                    size: 20,
                  ),
                  label: Text(
                    'Save',
                    style: TextStyle(color: Colors.green, fontSize: 20),
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
