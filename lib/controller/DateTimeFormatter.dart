class DateTimeFormatter {
  static formatDate(String dateTime) {
    var date = dateTime.split("T")[0];
    var mmdd = date.split("-");
    mmdd.removeAt(0);
    String month;
    switch (mmdd[0]) {
      case "01":
        month = "Jan";
        break;
      case "02":
        month = "Feb";
        break;
      case "03":
        month = "Mar";
        break;
      case "04":
        month = "Apr";
        break;
      case "05":
        month = "May";
        break;
      case "06":
        month = "Jun";
        break;
      case "07":
        month = "Jul";
        break;
      case "08":
        month = "Aug";
        break;
      case "09":
        month = "Sep";
        break;
      case "10":
        month = "Oct";
        break;
      case "11":
        month = "Nov";
        break;
      case "12":
        month = "Dec";
        break;
      default:
        month = "n/a";
        break;
    }

    return "${mmdd[1]} $month";
  }
}
