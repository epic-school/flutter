extension LowUp on String {

  String lowUp() =>
     toLowerCase().replaceRange(0, 1, this[0].toUpperCase());

}