import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'calresult.dart';
import 'imformationpage.dart';



void main() =>runApp(MaterialApp(home: Inputpage(),));

class BmiCalculator extends StatelessWidget {
  static const String id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Inputpage(),
    );
  }
}



class Inputpage extends StatefulWidget {
  Inputpage({Key Key}) : super(key: Key);
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  int currentindex = 0;
  int height = 180;
  int weight = 64;


  void info(){
    HomePage obj =HomePage();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator',style: TextStyle(color: Colors.black),),
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: (){
                info();
              },
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radiobutton('man', Colors.blue, 0),
                    radiobutton('woman', Colors.pink, 1),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text('height:',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      height = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText:'height in cm',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
                SizedBox(height: 20.0,),

                Text('weight',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      weight = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                      hintText:'weight in kg',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                  ),
                ),
                SizedBox(height:20.0,),

                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: (){
                      navigateToResultpage(18.0);
                    },
                    color: Colors.blue,
                    child: Text('CALCULATE',
                    style: TextStyle(
                      color:Colors.white,
                    ),),
                  ),
                )
              ],
          ),
          ),
        ),
      ),
    );
  }



  void changeIndex(int index){
    setState(() {
      currentindex = index;
    });
  }

  Widget radiobutton(String value,Color color,int index){
    return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 80.0,
          child: FlatButton(
            color: currentindex == index? color:Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),

              onPressed: (){
              changeIndex(index);
              },
              child: Text(value,
              style: TextStyle(
                color: currentindex == index? Colors.white : color,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ),
    );
  }
  void navigateToResultpage(double result){

      CalculateResult obj =CalculateResult(height, weight);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(obj.stringcalculateresult(),obj.msg,obj.getdescription())));
  }
}
