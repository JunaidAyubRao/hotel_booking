import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/hotelderail.dart';
import '../model/hotel.dart';
import 'loginscreen.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const pageName = "/DashboardScreen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
// Future<void> getnames()async{
// var x=FirebaseFirestore.instance.collection("usres").doc("shangai").collection("hotels");

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight =
        screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white38,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white38.withOpacity(0.5),
          title: const Text('Dashboard'),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/stars.jpg"))),
          child: StreamBuilder(
            stream: fireStore,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Center(
                  child: GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      Hotel hotel =
                          Hotel.fromMap(snapshot.data!.docs[index].data());
                      // print('hotelllllllllllllll:$hotel');
                      return Center(
                        child: ListTile(
                          title: SizedBox(
                              width: screenWidth * 0.5,
                              height: clientHeight * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelScreen(id: hotel.id))),
                                  child: Image.network(
                                    hotel.image_url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          subtitle: SizedBox(
                              width: screenWidth * 0.5,
                              height: clientHeight * 0.075,
                              child: Center(
                                child: Text(
                                  hotel.name,
                                  style: GoogleFonts.fasthand(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  auth
                      .signOut()
                      .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Signout Successfully'),
                          )))
                      .onError((error, stackTrace) =>
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Signout Cancel'),
                          )));
                  Navigator.of(context).pushNamed(LoginScreen.pageName);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const LoginScreen(),
                  // ));
                },
                child: const Text('SignOut')),
          ),
        ),
      ),
    );
  }
}





















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_project/view/hotelderail.dart';
// import '../model/hotel.dart';
// import 'loginscreen.dart';
// import 'profile.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
// // Future<void> getnames()async{
// // var x=FirebaseFirestore.instance.collection("usres").doc("shangai").collection("hotels");

//   @override
//   Widget build(BuildContext context) {
//     screenSize = MediaQuery.of(context).size;
//     screenWidth = screenSize.width;
//     screenHeight = screenSize.height;
//     clientHeight =
//         screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white38,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.white38.withOpacity(0.5),
//           title: const Text('Dashboard'),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   auth
//                       .signOut()
//                       .then((value) => ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text('Signout Successfully'),
//                           )))
//                       .onError((error, stackTrace) =>
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text('Signout Cancel'),
//                           )));
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const LoginScreen(),
//                   ));
//                 },
//                 icon: const Icon(Icons.logout))
//           ],
//         ),
//         body: Column(children: [
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: SizedBox(
//                 width: screenWidth * 0.8,
//                 height: clientHeight * 0.08,
//                 child: TextField(
//                   decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabled: true,
//                       hintText: 'Where are you gooing?',
//                       prefixIcon: const Icon(Icons.search),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20))),
//                 ),
//               ),
//             ),
//           ),
//           StreamBuilder(
//             stream: fireStore,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasData) {
//                 return Expanded(
//                   flex: 9,
//                   child: GridView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 300,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemBuilder: (context, index) {
//                       Hotel hotel =
//                           Hotel.fromMap(snapshot.data!.docs[index].data());
//                       // print('hotelllllllllllllll:$hotel');
//                       return Center(
//                         child: ListTile(
//                           title: SizedBox(
//                               width: screenWidth * 0.5,
//                               height: clientHeight * 0.2,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: InkWell(
//                                   onTap: () => Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ShanghaiHotelScreen(
//                                                   id: hotel.id))),
//                                   child: Image.network(
//                                     hotel.image_url,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               )),
//                           subtitle: SizedBox(
//                               width: screenWidth * 0.5,
//                               height: clientHeight * 0.1,
//                               child: Text(
//                                 hotel.name,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               } else {
//                 return const Text('Something went wrong');
//               }
//             },
//           )
//         ]),
//       ),
//     );
//   }
// }
