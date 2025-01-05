import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/calculate_port_usecase.dart';

part 'port_state.dart';

class PortCubit extends Cubit<PortState> {
  final CalculatePortUseCase useCase;

  PortCubit(this.useCase) : super(PortInitial());

  void calculatePort(int portNumber) {
    final result = useCase.execute(portNumber);
    if (result.shelf == "غير صالح") {
      emit(PortInvalid());
    } else {
      emit(PortCalculated(
        shelf: result.shelf,
        comb: result.comb,
        port: result.port,
      ));
    }
  }
}
