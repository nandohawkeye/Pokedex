String captalize(String? name) {
  if (name == null) {
    return "";
  }
  List<String> splittedName = name.split(' ');

  for (int i = 0; i < splittedName.length; i++) {
    splittedName[i] = splittedName[i].toLowerCase();

    if (splittedName[i].length > 1) {
      String firstLetter = splittedName[i][0].toUpperCase();
      String restOfName = splittedName[i].substring(1);

      splittedName[i] = "$firstLetter$restOfName";
    }
  }

  return splittedName.join(' ');
}
