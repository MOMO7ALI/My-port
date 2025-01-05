import 'package:flutter_application_1/features/port/domain/entities/port_entity.dart';

abstract class PortRepository {
  PortEntity calculatePort(int portNumber);
}
