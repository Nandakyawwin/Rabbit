class Rabbit {

  static String uni2zg(String output) {
    List<Map<String, String>> rules = {{UNI2ZG}};
    return Rabbit.replace_with_rule(rules, output);
  }

  static String zg2uni(String output) {
    List<Map<String, String>> rules = {{ZG2UNI}};
    return Rabbit.replace_with_rule(rules, output);
  }

  static String replace_with_rule(List<Map<String, String>> rules, String input) {
    rules.forEach((rule) {
      input = input.replaceAllMapped(RegExp(rule["from"]), (match1) {
        return rule["to"].replaceAllMapped(RegExp(r"#(\d{1})"), (match2) {
          var t = match1.group(int.parse(match2.group(1)));
          return t == null ? "" : t;
        });
      });
    });
    return input;
  }
}