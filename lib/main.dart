import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/port/data/repositories/port_repository_impl.dart';
import 'package:flutter_application_1/features/port/domain/usecases/calculate_port_usecase.dart';
import 'package:flutter_application_1/features/port/presentation/cubit/port_cubit.dart';
import 'package:flutter_application_1/features/port/presentation/pages/sereen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  final repository = PortRepositoryImpl();
  final useCase = CalculatePortUseCase(repository);

  runApp(MyApp(useCase));
}

class MyApp extends StatelessWidget {
  final CalculatePortUseCase useCase;

  const MyApp(this.useCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => PortCubit(useCase),
        child: PortScreen(),
      ),
    );
  }
}
