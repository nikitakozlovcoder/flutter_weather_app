extension CapitalizeExt on String {
  String capitilize() {
    if(isEmpty){
      return this;
    }

    return '${this[0].toUpperCase()}${length > 1 ? substring(1) : ''}';
  }
}