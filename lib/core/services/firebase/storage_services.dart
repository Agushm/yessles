// part of '../services.dart';

// class ServiceStorage {
//   static storage.FirebaseStorage _storage = storage.FirebaseStorage.instance;

//   static Future<String?> uploadImageProfileToFirebase(
//       File imageFile, String emailUser) async {
//     try {
//       storage.Reference reference =
//           _storage.ref().child('Profile').child(emailUser);
//       storage.UploadTask uploadTask = reference.putFile(imageFile);
//       storage.TaskSnapshot storageTaskSnapshot =
//           await uploadTask.whenComplete(() => null);
//       String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

//       return imageUrl;
//     } catch (err) {
//       return null;
//     }
//   }

//   static Future<String?> uploadImageReportToFirebase(
//       File imageFile, String peerId) async {
//     try {
//       storage.Reference reference =
//           _storage.ref().child('Report').child(peerId);
//       storage.UploadTask uploadTask = reference.putFile(imageFile);
//       storage.TaskSnapshot storageTaskSnapshot =
//           await uploadTask.whenComplete(() => null);
//       String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
//       print(imageUrl);
//       return imageUrl;
//     } catch (err) {
//       print(err);
//       return null;
//     }
//   }
// }
