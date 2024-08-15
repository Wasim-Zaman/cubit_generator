import 'dart:io';

import 'package:args/args.dart';
import 'package:cubit_generator/cubit_generator.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('name', abbr: 'n', help: 'Name of the Cubit');
  final results = parser.parse(arguments);

  final cubitName = results['name'] as String?;
  if (cubitName == null) {
    print('Please provide a Cubit name using --name or -n option.');
    exit(1);
  }

  generateCubit(cubitName);
}
