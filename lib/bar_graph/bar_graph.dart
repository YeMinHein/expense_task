import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class Bar_Graph extends StatelessWidget {
  final double? maxY;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double firAmount;
  final double satAmount;
  final double sunAmount;
  const Bar_Graph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.firAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thuAmount: thuAmount,
      firAmount: firAmount,
      satAmount: satAmount,
    );
    myBarData.IndividualBarData();
    return BarChart(BarChartData(
      gridData: FlGridData (show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
            getTitlesWidget: getbottomTitle,
        )),

      ),
      maxY: maxY,
      minY: 0,
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
              x: data.x, barRods: [BarChartRodData(toY: data.y,
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(2),
              width: 20,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: Theme.of(context).colorScheme.secondary
              )
      )]))
          .toList(),
    ));
  }
}
Widget getbottomTitle(double vale, TitleMeta meta){
  dynamic text;
const style = TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontSize: 14);

  switch(vale.toInt()){
    case 0 :
      text= const Text('S',style: style,);
      break;
      case 1 :
      text= const Text('M',style: style,);
      break;
      case 2 :
      text= const Text('T',style: style,);
      break;
      case 3 :
      text= const Text('W',style: style,);
      break;
      case 4 :
      text= const Text('T',style: style,);
      break;
      case 5 :
      text= const Text('F',style: style,);
      break;
    case 6 :
      text= const Text('S',style: style,);
      break;
    default:const Text('',style: style,);
    break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}