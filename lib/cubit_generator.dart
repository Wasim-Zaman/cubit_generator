import 'dart:io';

import 'package:path/path.dart' as path;

void generateCubit(String cubitName) {
  final currentDir = Directory.current;
  final libDir = Directory(path.join(currentDir.path, 'lib'));
  final cubitsDir = Directory(path.join(libDir.path, 'cubits'));

  if (!cubitsDir.existsSync()) {
    cubitsDir.createSync(recursive: true);
    print('Created cubits directory.');
  }

  final cubitDir =
      Directory(path.join(cubitsDir.path, cubitName.toLowerCase()));
  cubitDir.createSync();

  final cubitFile =
      File(path.join(cubitDir.path, '${cubitName.toLowerCase()}_cubit.dart'));
  final statesFile =
      File(path.join(cubitDir.path, '${cubitName.toLowerCase()}_state.dart'));

  writeCubitFile(cubitFile, cubitName);
  writeStatesFile(statesFile, cubitName);

  print('Generated Cubit: ${cubitDir.path}');
}

void writeCubitFile(File file, String cubitName) {
  final className = cubitName[0].toUpperCase() + cubitName.substring(1);
  final content = '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '${cubitName.toLowerCase()}_state.dart';

class ${className}Cubit extends Cubit<${className}State> {
  ${className}Cubit() : super(${className}Initial());

  // Add your cubit methods here
}
''';

  file.writeAsStringSync(content);
}

void writeStatesFile(File file, String cubitName) {
  final className = cubitName[0].toUpperCase() + cubitName.substring(1);
  final content = '''
part of '${cubitName.toLowerCase()}_cubit.dart';

abstract class ${className}State extends Equatable {
  const ${className}State();
  
  @override
  List<Object> get props => [];
}

class ${className}Initial extends ${className}State {}
''';

  file.writeAsStringSync(content);
}
