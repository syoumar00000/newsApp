import 'package:intl/intl.dart';
class ConvertisseurDate {
  String convertirDate(String string){
    String il = "il y a";
    String format = "yyyy-MM-dd hh:mm:ss";
    var formatter = DateFormat(format);
    DateTime dateTime = formatter.parse(string);
    if(dateTime == null){
      return "Date inconnue.";
    }else {
      var difference = new DateTime.now().difference(dateTime);
      var jours = difference.inDays;
      var heures = difference.inHours;
      var minutes = difference.inMinutes;
      if(jours > 1){
        return "$il $jours jours";
      } else if(jours == 1){
        return "$il 1 jour";
      } else if (heures > 1){
        return "$il $heures heures";
      } else if(heures == 1){
        return "$il 1 heure";
      }else if(minutes > 1){
        return "$il $minutes minutes";
      } else if (minutes == 1){
        return "$il 1 minute";
      } else "a l'instant.";
    }}}