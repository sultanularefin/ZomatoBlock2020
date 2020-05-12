
import 'package:flutter/material.dart';
import 'package:zomatoblock/BLoC/bloc.dart';
//import 'package:zomatoblock/DataLayer/location.dart';
//import 'package:zomatoblock/DataLayer/zomato_client.dart';
import 'dart:async';

// 1
//Future<int>
class BlocProvider<T extends Bloc> extends StatefulWidget {

  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  // 2
  static T of<T extends Bloc>(BuildContext context) {


    final type = _providerType<BlocProvider<T>>();

    final BlocProvider<T> provider =

    // this one is deprecated use this method:
    // context.findAncestorWidgetOfExactType();
    // context.ancestorWidgetOfExactType(type)

    context.findAncestorWidgetOfExactType();

    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
