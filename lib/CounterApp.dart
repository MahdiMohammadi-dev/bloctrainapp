import 'package:bloctrainapp/Bloc/CounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Number',
                  style: TextStyle(
                      fontSize: size.height / 26, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: BlocBuilder<CounterBloc, CounterAppState>(
              builder: (context, state) => Text(state.value.toString(),
                  style: TextStyle(
                      fontSize: size.height / 26, fontWeight: FontWeight.w600)),
            )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(PlusEvent());
                      print('plus clicked!!');
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: size.height / 22),
                    )),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(MinusEvent());
                      print('minus clicked!!');
                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: size.height / 22),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
