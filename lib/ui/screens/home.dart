// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cxl/bloc/counter_cubit.dart';
import 'package:cxl/ui/common/text.dart';
import 'package:cxl/ui/components/primary_action_button.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: HomeView(
        title: title,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  final String title;

  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: Center(
          child: Text(
            title,
            style: CxlText.HeroHeading,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: CxlText.Text,
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: CxlText.SecondaryHeading,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PrimaryActionButton(
            'Add',
            icon: Icons.add,
            callback: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          PrimaryActionButton(
            'Remove',
            icon: Icons.add,
            callback: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
