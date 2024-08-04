import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addCommand('create')
    ..addFlag('help', abbr: 'h');

  final argResults = parser.parse(arguments);

  if (argResults['help'] || argResults.command == null) {
    print('Usage: cubit_generator create <cubit_name>');
    print(parser.usage);
    exit(0);
  }

  if (argResults.command?.name == 'create') {
    final cubitName = argResults.rest.isNotEmpty ? argResults.rest[0] : null;

    if (cubitName == null) {
      print('Error: No cubit name provided.');
      exit(1);
    }

    createCubit(cubitName);
  }
}

void createCubit(String cubitName) {
  final cubitsDir = Directory('cubits');
  if (!cubitsDir.existsSync()) {
    cubitsDir.createSync();
  }

  final cubitDir = Directory('${cubitsDir.path}/$cubitName');
  if (!cubitDir.existsSync()) {
    cubitDir.createSync();
  }

  final cubitFile = File('${cubitDir.path}/${cubitName}_cubit.dart');
  final statesFile = File('${cubitDir.path}/${cubitName}_states.dart');

  cubitFile.writeAsStringSync(_cubitTemplate(cubitName));
  statesFile.writeAsStringSync(_statesTemplate(cubitName));

  print('Cubit and states files created successfully!');
}

String _cubitTemplate(String cubitName) {
  final className = _capitalize(cubitName);
  return '''
import 'package:bloc/bloc.dart';
part '${cubitName}_states.dart';

class ${className}Cubit extends Cubit<${className}State> {
  ${className}Cubit() : super(${className}Initial());

  // Define your methods and logic here
}
  ''';
}

String _statesTemplate(String cubitName) {
  final className = _capitalize(cubitName);
  return '''
part of '${cubitName}_cubit.dart';

abstract class ${className}State {}

class ${className}Initial extends ${className}State {}
  ''';
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
