class JuzStates {}

class JuzStatesInitial extends JuzStates {}

class JuzStatesLoading extends JuzStates {}

class JuzStatesSuccess extends JuzStates {
  final List<dynamic> juz;

  JuzStatesSuccess(this.juz);
}

class JuzStatesFailed extends JuzStates {
  final String errMessage;

  JuzStatesFailed(this.errMessage);
}
