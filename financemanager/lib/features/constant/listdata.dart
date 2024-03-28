import 'package:financemanager/features/models/data.dart';
import 'package:financemanager/features/constant/images.dart';

List<Money>getter(){
  Money upwork=Money(name: 'upwork',fee: '650',time: 'today',img: Img.upwork,buy: false);
  Money starbuck=Money(name: 'Starbuck',fee: '20',time: 'today',img: Img.starbucks,buy: true);
  Money transfer=Money(name: 'Transport',fee: '200',time: 'today',img: Img.tran,buy: true);
  return [upwork,starbuck,transfer];
}


  const List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];