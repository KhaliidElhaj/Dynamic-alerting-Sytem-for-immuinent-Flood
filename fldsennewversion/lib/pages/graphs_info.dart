import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:fldsenv1/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GraphsInfo extends StatefulWidget {
  const GraphsInfo({Key? key}) : super(key: key);

  @override
  _GraphsInfoState createState() => _GraphsInfoState();
}
//will house the spots for the chart has water velocity and water level.
List<FlSpot> wVSpots = [];
List<FlSpot> wlSpots = [];

final List<double> wVyValues = [
  0,
];

final List<double> wlyValues = [
  0,
];

//supposed to be for the graph but its broken...

List<Color> waterVelocityListColor = [
  const Color(0xFF24FF00),
  const Color(0xFF24FF00),
];

List<Color> waterLevelListColor = [
  const Color(0xFF01B8FF),
  const Color(0xFF01B8FF),
];

//dynamic wLYaxis = waterLevel;

class _GraphsInfoState extends State<GraphsInfo> {
  static const maxSecondsGraph = 60;
  int secondsGraph = maxSecondsGraph;
  Timer? _timerGraph;

  @override
  void initState() {
    startTimerGraph();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          AppLocalizations.of(context)!.lineGraph,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: AnimatedContainer(
        decoration: BoxDecoration(
          image:  DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop) ,
              repeat: ImageRepeat.repeat,
              image:  const AssetImage('lib/resources/images/tetrapods.png')),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bgColor),
        ),
        duration: const Duration(milliseconds: 500),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               Text(
                AppLocalizations.of(context)!.eSixS,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white10.withOpacity(1),
                      ),
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(14)),
                  child: Stack(
                    children:[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 15),
                        child: LineChart(LineChartData(
                            titlesData: FlTitlesData(
                              topTitles: SideTitles(
                                showTitles: false,
                              ),
                              rightTitles: SideTitles(
                                showTitles: false,
                              ),
                              leftTitles: SideTitles(
                                textAlign: TextAlign.start,
                                showTitles: true,
                                margin: 1,
                              ),
                              bottomTitles: SideTitles(
                                textAlign: TextAlign.center,
                                showTitles: true,
                                margin: 1,
                              ),
                            ),
                            minX: 1,
                            minY: 1,
                            maxX: 20,
                            maxY: 30,
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: true,
                              drawHorizontalLine: true,
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                colors: waterVelocityListColor,
                                spots: wVSpots,
                                isCurved: true,
                                barWidth: 3,
                                // belowBarData: BarAreaData(
                                //   colors: waterVelocityListColor,
                                //   show: true,
                                // )
                              ),
                              LineChartBarData(
                                //colors: waterVelocityListColor,
                                spots: wlSpots,
                                isCurved: true,
                                barWidth: 3,
                                // belowBarData: BarAreaData(
                                //   colors: waterVelocityListColor,
                                //   show: true,
                                // )
                              )
                            ])),
                      ),
                       RotatedBox(quarterTurns: 1,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(AppLocalizations.of(context)!.meters))),
                     Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(AppLocalizations.of(context)!.eNoREP)),
                  ]
                  ),
                ),
              ),
               SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xFF01B8FF),
                    ),
                    Text(' '+AppLocalizations.of(context)!.water_level,style: const TextStyle(
                      color: Colors.white,
                    ),),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xFF24FF00),
                    ),
                    Text(' '+AppLocalizations.of(context)!.water_velocity,style: const TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void startTimerGraph() {
    _timerGraph = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (waterLevel == 0.0 && waterVelocity == 0) {
          //debugPrint('Water Level is 0 and will not be added to the line chart');
        } else {
          if (secondsGraph > 0) {
            secondsGraph--;
          } else {
            wVyValues.add(waterVelocity);
            List<FlSpot> spots = wVyValues.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value);
            }).toList();
            wVSpots = spots;

            wlyValues.add(waterLevel);
            spots = wlyValues.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value);
            }).toList();
            wlSpots = spots;
            debugPrint(spots.toString());
            restartTimerGraph();
          }
        }
      });
    });
  }

  void restartTimerGraph() {
    secondsGraph = maxSecondsGraph;
    _timerGraph!.cancel();
    startTimerGraph();
    debugPrint('RESTARTED GRAPH TIMER, UPDATING VALUES');
  }

}
