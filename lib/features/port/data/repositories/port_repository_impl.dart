import '../../domain/entities/port_entity.dart';
import '../../domain/repositories/port_repository.dart';

class PortRepositoryImpl implements PortRepository {
  @override
  PortEntity calculatePort(int portNumber) {
    if (portNumber < 1 || portNumber > 2048) {
      return PortEntity(shelf: "غير صالح", comb: "غير صالح", port: "غير صالح");
    }

    int shelfNumber = (portNumber - 1) ~/ 1024 + 1;
    int combNumber = ((portNumber - 1) % 1024) ~/ 16 + 1;
    int portInComb = ((portNumber - 1) % 16) + 1;

    return PortEntity(
      shelf: "شيلف $shelfNumber",
      comb: "مشط $combNumber",
      port: "بورت $portInComb",
    );
  }
}
