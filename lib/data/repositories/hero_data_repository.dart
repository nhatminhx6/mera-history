import 'package:mera_history/data/models/figure_model.dart';
import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/repositories/figure_repository_impl.dart';

class HeroDataRepository {
  HeroDataRepository(this._figureRepository);

  final FigureRepositoryImpl _figureRepository;

  Future<List<HeroModel>> getAll() async {
    final figures = await _figureRepository.getAllFigures();
    return List<HeroModel>.generate(
      figures.length,
      (index) => _mapFigureToHero(figures[index], index + 1),
    );
  }

  HeroModel _mapFigureToHero(FigureModel figure, int id) {
    final years = RegExp(r'(-?\d{1,4})').allMatches(figure.period).toList();
    final born = years.isNotEmpty ? int.parse(years.first.group(0)!) : 0;
    final died = years.length > 1 ? int.parse(years[1].group(0)!) : born + 40;

    return HeroModel(
      id: id,
      name: figure.name,
      born: born,
      died: died,
      description: figure.description,
      image: 'https://picsum.photos/seed/${figure.id}/900/1200',
      role: figure.role,
      period: figure.period,
    );
  }
}
