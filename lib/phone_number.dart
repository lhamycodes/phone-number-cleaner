class PhoneNumber {
  // Put your code here
  String clean(dynamic number) {
    var input = number.toString().trim();
    input = input.replaceAll("+", "");
    RegExp reg = RegExp(r'\d');
    var numDigits = reg.allMatches(input).length;

    if (input.contains(RegExp(r'[A-Za-z]')))
      throw FormatException("letters not permitted");

    if (numDigits == 9) throw FormatException("incorrect number of digits");

    if (numDigits > 11) throw FormatException("more than 11 digits");

    if (numDigits == 10) {
      input = "1" + input;
      numDigits++;
    }

    if (numDigits == 11 && input.substring(0, 1) != '1')
      throw FormatException("11 digits must start with 1");

    var regExp = RegExp(r"1\D*\(?([2-9]\d\d)\)?\D*([2-9]\d\d)\D*(\d{4})$");
    var matches = regExp.allMatches(input.trim());

    if (!regExp.hasMatch(input.trim())) {
      String inp =
          input.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "");
      if (inp.substring(1, 2) == "0" || input.substring(1, 3) == "(0")
        throw FormatException("area code cannot start with zero");
      else if (inp.substring(1, 2) == "1" || input.substring(1, 3) == "(1")
        throw FormatException("area code cannot start with one");
      else if (inp.substring(4, 5) == "0" || input.substring(4, 6) == "(0")
        throw FormatException("exchange code cannot start with zero");
      else if (inp.substring(4, 5) == "1" || input.substring(4, 6) == "(1")
        throw FormatException("exchange code cannot start with one");
      else if (input.contains(RegExp(r'[^@:!]')))
        throw FormatException("punctuations not permitted");
      return null;
    } else {
      for (var match in matches) {
        var start = match.start;
        var end = match.end;

        String formatted = input
            .trim()
            .substring(start, end)
            .split(" ")
            .join()
            .replaceAll("(", " ")
            .replaceAll(")", " ")
            .replaceAll("-", " ")
            .replaceAll(".", " ")
            .substring(1);

        String out = formatted.replaceAll(" ", "");

        return out;
      }
      return null;
    }
  }
}
