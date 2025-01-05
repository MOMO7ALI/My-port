part of 'port_cubit.dart';

abstract class PortState {}

class PortInitial extends PortState {}

class PortInvalid extends PortState {}

class PortCalculated extends PortState {
  final String shelf;
  final String comb;
  final String port;

  PortCalculated({
    required this.shelf,
    required this.comb,
    required this.port,
  });
}
