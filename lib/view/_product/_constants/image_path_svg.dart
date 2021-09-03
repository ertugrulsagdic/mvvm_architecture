import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;

  static SVGImagePaths? get instance => _instance ??= SVGImagePaths._init();

  SVGImagePaths._init();

  final relaxSVG = 'relax'.toSVG;
  final astronautSVG = 'astronaut'.toSVG;
  final chattingSVG = 'chat'.toSVG;
}
