import 'package:example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseCubitComparableBuilderPage extends HookWidget {
  UseCubitComparableBuilderPage({Key? key}) : super(key: key);

  final CounterCubit cubit = CounterCubit("My cubit");

  @override
  Widget build(BuildContext context) {
    // The state will be updated along with the widget
    // We can compare state's changes to allow rebuild
    final state = useBlocComparableBuilder(
      cubit,
      buildWhen: (int previous, int current) {
        print("Previous: $previous");
        print("Current: $current");
        return current - previous > 1;
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("useCubitBuilder")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cubit.increment(),
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text("The button has been pressed $state times")),
    );
  }
}
