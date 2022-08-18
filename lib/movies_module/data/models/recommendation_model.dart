import 'package:movies_app/movies_module/domain/entities/recommadition.dart';

class RecommendationModel extends Recommndation{
  const RecommendationModel(super.backDropPath, super.id);
 factory RecommendationModel.fromJson(Map<String,dynamic> json)=>RecommendationModel(json['backdrop_path'], json['id']);

}