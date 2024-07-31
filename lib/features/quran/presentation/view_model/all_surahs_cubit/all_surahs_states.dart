class AllSurahsStates {}

class AllSurahsInitial extends AllSurahsStates {}

class AllSurahsLoading extends AllSurahsStates {}

class AllSurahsSuccess extends AllSurahsStates {
  final List<String> surahs;

  AllSurahsSuccess(this.surahs);
}

class AllSurahsFailed extends AllSurahsStates {
  final String errMessage;

  AllSurahsFailed(this.errMessage);
}
