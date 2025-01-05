import '../entities/port_entity.dart';
import '../repositories/port_repository.dart';

class CalculatePortUseCase {
  final PortRepository repository;

  CalculatePortUseCase(this.repository);

  PortEntity execute(int portNumber) {
    return repository.calculatePort(portNumber);
  }
}
