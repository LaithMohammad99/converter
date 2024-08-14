import 'package:flutter/material.dart';
import 'package:taske_bloc_converte/ui/screens/counter/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske_bloc_converte/ui/screens/counter/bloc/events.dart';
import 'package:taske_bloc_converte/ui/screens/counter/bloc/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: BlocConsumer<CounterBloc, CounterStates>(
        listener: (BuildContext context, CounterStates state) {
          if(state is SuccessCounterState){
            print("SuccessCounterState");
          }

        },
        builder: (BuildContext context, CounterStates state) {


          CounterBloc counterBloc = CounterBloc.get(context);


          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Counter Bloc",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.teal,
              centerTitle: true,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(IncrementCounterValue());
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                   Text(
                     counterBloc.count.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        counterBloc.add(DecrementCounterValue());

                      }, child: const Icon(Icons.remove)),
                ],
              ),
            ),
          );},

      ),
    );
  }
}
