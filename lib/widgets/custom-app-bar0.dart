// import 'package:flutter/material.dart';
// import 'package:Sunkiss/commons/variables.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSize {
//   int nonUsableWidth = 55;
//   @override
//   Size get preferredSize => Size.fromHeight(60);
//   @override
//   final Widget child;
//   CustomAppBar({Key? key, this.child = const SizedBox()}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     double topPadding = 12 + MediaQuery.of(context).viewPadding.top;
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints viewportConstraints) =>
//           PreferredSize(
//         preferredSize: preferredSize,
//         child: Container(
//           decoration: BoxDecoration(
//             color: local_colors["bars"],
//             boxShadow: [
//               BoxShadow(
//                 color: const Color.fromARGB(255, 216, 216, 216),
//                 offset: Offset.fromDirection(1),
//                 blurRadius: 1,
//                 spreadRadius: 1,
//               ),
//             ],
//           ),
//           padding: EdgeInsets.fromLTRB(10, topPadding, 25, 12),
//           child: Row(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                   right: 10,
//                 ),
//                 child: Navigator.canPop(context)
//                     ? GestureDetector(
//                         onTap: () {
//                           Navigator.pop(
//                             context,
//                           );
//                         },
//                         child: Icon(
//                           Icons.arrow_back_rounded,
//                           color: local_colors["onBackground"],
//                           size: 20,
//                         ),
//                       )
//                     : const SizedBox(
//                         width: 10,
//                       ),
//               ),
//               ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minWidth: viewportConstraints.minWidth -
//                       (Navigator.canPop(context)
//                           ? nonUsableWidth + 10
//                           : nonUsableWidth),
//                 ),
//                 child: child,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
