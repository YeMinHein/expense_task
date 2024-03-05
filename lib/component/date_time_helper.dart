String convertDateTimeToString (DateTime dateTime){
  String year =dateTime.year.toString();
  String month = dateTime.month.toString();
  if(month.length ==1) month = '0$month';
  String date = dateTime.day.toString();
  if(date.length ==1) date='0$date';
  String yyyymmdd = year+month+date;
  return yyyymmdd;
}