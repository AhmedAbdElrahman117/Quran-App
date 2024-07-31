class SurahStates {}

class SurahInitial extends SurahStates {}

class SurahLoading extends SurahStates {}

class SurahSuccess extends SurahStates {
  final List<dynamic> data;

  SurahSuccess(this.data);
}

class SurahFailed extends SurahStates {
  final String errMessage;

  SurahFailed(this.errMessage);
}
