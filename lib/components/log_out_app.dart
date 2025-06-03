// import 'package:pms/config/Router/page_router_name.dart';
// import 'package:pms/config/Router/routing_service.dart';
// import 'package:pms/logic/Provider/HomeProvider/home_provider.dart';
// import 'package:pms/logic/Provider/PaymentRequisitionProvider/payment_requisition_provider.dart';
// import 'package:pms/logic/Provider/ProjectProvider/project_provider.dart';
// import 'package:pms/main.dart';
// import 'package:flutter/material.dart';
// import 'package:pms/const/color_const.dart';
// import 'package:pms/components/text_style.dart';
// import 'package:provider/provider.dart';

// Widget logOutApp(BuildContext context) {
//   return AlertDialog(
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: Align(
//             alignment: AlignmentDirectional.topEnd,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Image.asset(
//                 "assets/images/cross.png",
//                 width: 20,
//                 height: 20,
//                 fit: BoxFit.fill,
//                 color: black.withOpacity(0.6),
//               ),
//             ),
//           ),
//         ),
//         const Text(
//           "Are you sure?",
//           style: TextStyle(
//               color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         const Text(
//           "You want to Logout!",
//           style: TextStyle(color: Colors.black, fontSize: 15),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             Future.delayed(Duration.zero, () async {
//               await preferences.clear();
//               RoutingService().goName(Routes.loginScreen.name);
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: white,
//           ),
//           child: Text(
//             "Yes",
//             style: TextStyle(
//               color: black,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
