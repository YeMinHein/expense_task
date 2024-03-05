import 'individual_bar.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double firAmount;
  final double satAmount;
  final double sunAmount;

  BarData({required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.firAmount,
    required this.satAmount,
    required this.sunAmount,
  });

  List<IndividualBar> barData =[];
  void IndividualBarData(){
    barData = [
      IndividualBar(x:0 ,y: sunAmount),
      IndividualBar(x:1 ,y: monAmount),
      IndividualBar(x:2 ,y: tueAmount),
      IndividualBar(x:3 ,y: wedAmount),
      IndividualBar(x:4 ,y: thuAmount),
      IndividualBar(x:5 ,y: firAmount),
      IndividualBar(x:6 ,y: satAmount),
    ];
  }
}