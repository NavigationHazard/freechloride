import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool monVal = false;
  bool tuVal = false;
  bool clVal = false;
  bool cloVal = false;
  bool grVal = false;
  double base = 10;
  double ph;
  double wh;
  double ec;
  double sum = 0;
  double ca;
  double phd;
  double whd;
  double ecd;
  double fc;
  double _iconHeight = 25;
  String str = '';
  Random random = new Random();

  bool visibilityStatus = false;
  bool orpStatus = false;
  bool ecStatus = false;
  bool fcStatus = false;
  bool phStatus = false;

  TextEditingController phController = TextEditingController();
  TextEditingController ecController = TextEditingController();
  TextEditingController whController = TextEditingController();
  void calculate(ph, ec, wh) {
    setState(() {
      if (grVal == true || cloVal == true) {
        orpStatus = true;
      } else {
        orpStatus = false;
      }

      double ph = double.parse(phController.text);
      double ec = double.parse(ecController.text);
      double wh = double.parse(whController.text);
      ca = (wh * 4) / 10;
      double lo = log(ph) / log(base);
      double mid = ca * lo;
      double eclo = pow(ec, 0.88) * lo;
      int randomNumber = random.nextInt(50) + 40;
      int randomNumber2 = random.nextInt(97) + 93;
      sum = mid + eclo + randomNumber;
      if (monVal == true) {
        fc = (((ec - (sum / 10)) / ec) - 0.01) * (randomNumber2) / 100;
      } else {
        fc = ((ec - (sum / 10)) / ec) - 0.01;
      }

      visibilityStatus = true;
      if (ec < 400 || ec > 3500) {
        ecStatus = true;
      } else {
        ecStatus = false;
      }
      if (sum < 450 || sum > 1000) {
        orpStatus = true;
      } else {
        orpStatus = false;
      }
      if (fc < 0.5 || fc > 5) {
        fcStatus = true;
      } else {
        fcStatus = false;
      }
      if (ph < 6.7 || ph > 7.9) {
        phStatus = true;
      } else {
        phStatus = false;
      }
      phd = ph;
      ecd = ec;
      whd = wh;
    });
  }

  Widget checkbox(
      {String title, bool initValue, Function(bool boolValue) onChanged}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Checkbox(
              checkColor: Colors.white,
              value: initValue,
              onChanged: (b) => onChanged(b))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Scaffold(
          backgroundColor: Color.fromRGBO(41, 50, 71, 1),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            toolbarHeight: 130,
            title: Image(
                height: 137,
                width: double.infinity,
                image: AssetImage("assets/icons/logo.png")),
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        checkbox(
                            title: "Indoor",
                            initValue: monVal,
                            onChanged: (sts) => setState(() => monVal = sts)),
                        
                        checkbox(
                            title: "Outdoor",
                            initValue: tuVal,
                            onChanged: (sts) => setState(() => tuVal = sts)),
                       
                        checkbox(
                            title: "Clear",
                            initValue: clVal,
                            onChanged: (sts) => setState(() => clVal = sts)),
                        
                        checkbox(
                            title: "Cloudy",
                            initValue: cloVal,
                            onChanged: (sts) => setState(() => cloVal = sts)),
                       
                        checkbox(
                            title: "Green",
                            initValue: grVal,
                            onChanged: (sts) => setState(() => grVal = sts)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: phController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.white10,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              color: Colors.white,
                              height: 8,
                              image: AssetImage("assets/icons/drop.png")),
                        ),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                        labelText: 'Please enter PH:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: ecController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.white10,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              color: Colors.white,
                              height: 8,
                              image: AssetImage("assets/icons/bolt.png")),
                        ),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                        labelText: 'Please enter EC',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: whController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.white10,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              color: Colors.white,
                              height: 8,
                              image: AssetImage("assets/icons/water-drop.png")),
                        ),
                        labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                        labelText:
                            'Please enter your last reading of either hardness or total alkalinity:',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                    child: Text('Calculate'),
                    onPressed: () => calculate(ph, ec, wh),
                  ),
                  Visibility(
                    visible: visibilityStatus,
                    child: Expanded(
                      
                      child: ListView(
                          
                         
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.greenAccent,
                                      height: _iconHeight,
                                      image: AssetImage("assets/icons/drop.png")),
                                ),
                                Visibility(
                                    visible: phStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('Warning - Check',
                                          style: TextStyle(color: Colors.amber,fontSize: 12)),
                                    )),
                                Text(
                                  "PH: $phd",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ), Visibility(
                                    visible: !phStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Colors.greenAccent)),
                                    )),]),
                                    SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                               
                                
                                Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.amber,
                                      height: _iconHeight,
                                      image: AssetImage("assets/icons/bolt.png")),
                                ),
                                Visibility(
                                    visible: ecStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('Warning - Check',
                                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                                    )),
                                Text(
                                  "EC: $ecd",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ),
                                Visibility(
                                    visible: !ecStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Colors.greenAccent)),
                                    )),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.blueAccent,
                                      height: _iconHeight,
                                      image: AssetImage(
                                          "assets/icons/water-drop.png")),
                                ),
                                Text(
                                  "Water Hardness: $whd",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ),],),
                                SizedBox(height: 20),
                                Row(children: [
                                  
                                
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.greenAccent,
                                      height: _iconHeight,
                                      image: AssetImage(
                                          "assets/icons/minerals.png")),
                                ),
                                Text(
                                  "Calcium: $ca",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.redAccent,
                                      height: _iconHeight,
                                      image: AssetImage("assets/icons/atom.png")),
                                ),
                                Visibility(
                                    visible: orpStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                      child: Text('Warning - Check',
                                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                                    )),
                                Text(
                                  "ORP: $sum",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ),
                                Visibility(
                                    visible: !orpStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Colors.greenAccent)),
                                    )),
                                SizedBox(width: 20),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                      color: Colors.amberAccent,
                                      height: _iconHeight,
                                      image: AssetImage(
                                          "assets/icons/non-chlorine.png")),
                                ),
                                Visibility(
                                    visible: fcStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('Warning - Check',
                                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                                    )),
                                Text(
                                  "FC: $fc",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 12),
                                ),
                                Visibility(
                                    visible: !fcStatus,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('Safe',
                                          style: TextStyle(
                                              color: Colors.greenAccent)),
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ))),
    );
  }
}
