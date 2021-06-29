import 'package:flutter/material.dart';
import '../data.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List _continents = [];
  var jsonData = Data();
  void loadData() async{
    await jsonData.getContinents();
    setState(() {
      _continents = jsonData.continents;
    });
  }
 @override
 void initState(){
    loadData();
    super.initState();
 }
  Widget build(BuildContext context) {
    return
        ListView.builder(
            itemCount: _continents.length,
            itemBuilder: (BuildContext context , int index){
              return Text(_continents[index],);
            });


     /* Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5,bottom: 5),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    countries('images/europe.PNG','Europe'),
                    SizedBox(width: 5,),
                    countries('images/africa.PNG','Africa')
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    countries('images/austrilia.PNG','Austrilia'),
                    SizedBox(width: 5,),
                    countries('images/nourth america.PNG','North America')
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    countries('images/south America.PNG','South America'),
                    SizedBox(width: 5,),
                    countries('images/asia.PNG','Asia')
                  ],
                ),
                SizedBox(height: 5,),
                countries('images/antarcatica.PNG','Antarctica'),

              ],
            ),
          ),
        ),
      ),
    );*/

  }

  Widget countries(String images,String nameCountry) {
    return GestureDetector(
        child: Container(
          width: 170,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
          ),
          child: Column(
            children: [
              Image.asset(images,height: 160,width: 150,),
              //SizedBox(height: 5,),
              Text(nameCountry,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
      onTap: _OnTap,
    );
  }

  Widget _OnTap(){
    _continents.length > 0? Expanded(
        child:ListView.builder(
            itemCount: _continents.length,
            itemBuilder: (context , index){
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Text(_continents[index]['id']),
                  title: Text(_continents[index]['description']),
                ),
              );
            }) ): Container();
  }



/*





////////////////////


ListView.builder(
        itemCount: _continents.length,
        itemBuilder: (BuildContext context , int index){
          return Text(_continents[index]);
        });

        //////////////////////



*/
}