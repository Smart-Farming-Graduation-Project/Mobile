class PestDetectionInfoModel {
  String? modelId;
  String? disease;
  String? solution;

  PestDetectionInfoModel({this.modelId, this.disease, this.solution});

  factory PestDetectionInfoModel.fromJson(Map<String, dynamic> json) {
    return PestDetectionInfoModel(
      modelId: json['modelId'] as String?,
      disease: json['disease'] as String?,
      solution: json['solution'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'modelId': modelId,
        'disease': disease,
        'solution': solution,
      };
}
