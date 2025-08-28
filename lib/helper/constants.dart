import 'package:firebase_auth/firebase_auth.dart';

final String currentUser = FirebaseAuth.instance.currentUser!.email!;