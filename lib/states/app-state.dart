// AppStateController
import 'package:Sunkiss/states/blocs/bloc-provider.dart';
import 'package:flutter/material.dart';

class AppStateController extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;

  const AppStateController(
      {Key? key, required this.blocProvider, required this.child})
      : super(key: key);

  @override
  State<AppStateController> createState() => AppState();

  static AppState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_AppStateWidget>()
            as _AppStateWidget)
        .appState;
  }
}
// AppState

class AppState extends State<AppStateController> {
  BlocProvider get blocProvider => widget.blocProvider;

  void handleSave(index) {
    setState(() {
      blocProvider.contentBloc.handleSave(index);
    });
  }

  void handleRating(int index, int rate) {
    setState(() {
      blocProvider.contentBloc.handleRating(index, rate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(
      appState: this,
      child: widget.child,
    );
  }
}

class _AppStateWidget extends InheritedWidget {
  final AppState appState;
  const _AppStateWidget(
      {Key? key, required this.appState, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) {
    return true;
  }
}
