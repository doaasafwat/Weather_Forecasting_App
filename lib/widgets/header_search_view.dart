import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderSearchView extends StatelessWidget {
  const HeaderSearchView({super.key});
  Future<DocumentSnapshot> getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String uid = currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 18, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.person,
                size: 50,
              ),
            ),
            const SizedBox(width: 10),
            FutureBuilder<DocumentSnapshot>(
              future: getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error',
                      style: TextStyle(color: Colors.red));
                } else if (snapshot.hasData) {
                  var userData = snapshot.data!.data() as Map<String, dynamic>?;
                  String username = userData?['username'] ?? 'User';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Welcome Back',
                        style: TextStyle(
                            color: Color(0xff9f7cff),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        username,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  );
                } else {
                  return const Text('No Data');
                }
              },
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
