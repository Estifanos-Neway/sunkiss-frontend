import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/widgets/custom-app-bar.dart';
import 'package:Sunkiss/widgets/custom-scrollable.dart';
import 'package:flutter/cupertino.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollable(
      child: Column(
        children: [
          CustomAppBar(
            where: "Account",
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SettingGroup(
                  title: "Account",
                  settings: [
                    AccountDetail(
                      title: "Signed in as",
                      detail: "adamsmith@gmail.com (email)",
                    ),
                    AccountDetail(
                      title: "Password",
                      detail: "********",
                    ),
                    AccountDetail(
                      title: "Member since",
                      detail: "May 16, 2022",
                    ),
                    AccountDetail(
                      title: "Reaction count",
                      detail: "78",
                    ),
                  ],
                ),
                SettingGroup(
                  title: "Preferences",
                  settings: [
                    SingleSetting(
                      singleSettingContent: Row(
                        children: [
                          Text(
                            "Dark theme",
                            style: TextStyle(
                              color: local_colors["onSurface"],
                            ),
                          ),
                          Expanded(
                            child: Row(),
                          ),
                          Transform.scale(
                            scale: 0.5,
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: CupertinoSwitch(
                                value: false,
                                onChanged: (bool state) {},
                                activeColor: local_colors["onSurface"],
                                trackColor: local_colors["background"],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleSetting(
                      singleSettingContent: Row(
                        children: [
                          Text(
                            "Suggestions per day",
                            style: TextStyle(
                              color: local_colors["onSurface"],
                            ),
                          ),
                          Expanded(
                            child: Row(),
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              color: local_colors["onSurface"],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleSetting(
                      singleSettingContent: Row(
                        children: [
                          Text(
                            "Another preference",
                            style: TextStyle(
                              color: local_colors["onSurface"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SettingGroup(
                  title: "Actions",
                  settings: [
                    SingleSetting(
                      singleSettingContent: Row(
                        children: [
                          Text(
                            "Sign out",
                            style: TextStyle(
                              color: local_colors["link"],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleSetting(
                      singleSettingContent: Row(
                        children: [
                          Text(
                            "Delete account",
                            style: TextStyle(
                              color: local_colors["danger"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountDetail extends StatelessWidget {
  final String title;
  final String detail;
  const AccountDetail({Key? key, required this.title, required this.detail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: local_colors["onBackground"]),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: 13,
              color: local_colors["onBackground"],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingGroup extends StatelessWidget {
  final String title;
  final List<Widget> settings;
  const SettingGroup({Key? key, required this.title, required this.settings})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: local_colors["onBackground"]),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: settings
                  .map(
                    (setting) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: setting,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleSetting extends StatelessWidget {
  final Widget singleSettingContent;
  const SingleSetting({Key? key, required this.singleSettingContent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: local_colors["surface"]),
      child: singleSettingContent,
    );
  }
}
