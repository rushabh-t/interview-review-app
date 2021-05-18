import 'package:interview_review_app/domain/entities/chip_entity.dart';

abstract class FeedbackScreenConstants {
  FeedbackScreenConstants._();
  static List<ChipEntity> chipList = [
    ChipEntity(chipTitle: "Politeness"),
    ChipEntity(chipTitle: "Professionalism"),
    ChipEntity(chipTitle: "Expertise"),
    ChipEntity(chipTitle: "Guidance"),
    ChipEntity(chipTitle: "Attentiveness"),
    ChipEntity(chipTitle: "Questions Asked"),
    ChipEntity(chipTitle: "Quality of Questions"),
  ];
}
