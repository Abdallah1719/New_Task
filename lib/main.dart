import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/business_logic/notes_cubits/cubit/notes_cubit.dart';
import 'package:notes/business_logic/to_do_cubits/cubit/to_do_cubit.dart';
import 'package:notes/constant.dart';
import 'package:notes/models/notes_model/notes_model.dart';
import 'package:notes/models/to_do_model/to_do_model.dart';
import 'package:notes/presentation/screens/notes_screen.dart';

import 'presentation/shared/bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoModelAdapter());
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(knotesBox);
  await Hive.openBox<ToDoModel>(ktodoBox);
  runApp(const Notes());
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => ToDoCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesScreen(),
      ),
    );
  }
}