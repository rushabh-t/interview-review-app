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
  static const String ratingText = "YOU HAVE RATED YOUR INTERVIEWER";
  static const String changeRating = "CHANGE";
  static const String qualities = "What made the interviewers ";
  static const String comment = "ADD COMMENT";
  static const String submit = "SUBMIT";
}
