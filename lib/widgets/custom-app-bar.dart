
import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/commons/functions.dart';

class CustomAppBar extends StatelessWidget {
  final String where;
  late Widget headerContent;
  CustomAppBar({Key? key, this.where = ""}) : super(key: key) {
    switch (where.toLowerCase()) {
      case "home":
        headerContent = Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: const AssetImage(
                  "assets/images/dog.jpg",
                ),
                backgroundColor: local_colors["surface"],
                radius: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: local_colors["onBackground"],
                    ),
                  ),
                  Text(
                    "Good ${getGreetingTime()}",
                    style: TextStyle(
                      fontSize: 15,
                      color: local_colors["onBackground"],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        break;
      case "saved":
      case "search":
        headerContent = Row(
          children: [
            Text(
              where,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: local_colors["onBackground"],
              ),
            ),
          ],
        );
        break;
      case "account":
        headerContent = Row(
          children: [
            CircleAvatar(
              foregroundImage: const AssetImage(
                "assets/images/dog.jpg",
              ),
              backgroundColor: local_colors["surface"],
              radius: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Adam Smith",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: local_colors["onBackground"],
              ),
            ),
          ],
        );
        break;
      default:
        headerContent = Row(
          children: [
            Text(
              where,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).viewPadding.top + 10,
        20,
        15,
      ),
      child: headerContent,
    );
  }
}
