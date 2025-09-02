// import 'package:expense_tracker/auth/auth_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});

//   static const String profileRoute = 'ProfileView';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: ProfileBodyView());
//   }
// }

// class ProfileBodyView extends StatelessWidget {
//   const ProfileBodyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Image.asset('assets/images/appbar.jpg'),
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Theme.of(context).colorScheme.onPrimary,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 200,
//                 left: 12,
//                 right: 12,
//                 child: SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: ClipOval(
//                     child: CircleAvatar(
//                       backgroundColor: Theme.of(context).colorScheme.primary,
//                       child: Icon(
//                         Icons.person,
//                         size: 100,
//                         color: Theme.of(context).colorScheme.onPrimary,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 ProfileListTile(
//                   title: 'Profile Info',
//                   icon: Icons.person,
//                   onTap: () {
//                     // Handle profile info tap
//                   },
//                 ),
//                 ProfileListTile(
//                   title: 'Logout',
//                   icon: Icons.logout,
//                   onTap: () {
//                     // Handle logout tap
//                     FirebaseAuth.instance.signOut();
//                     Navigator.pushNamed(context, AuthPage.authRoute);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileListTile extends StatelessWidget {
//   const ProfileListTile({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onTap,
//   });

//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
//   }
// }
