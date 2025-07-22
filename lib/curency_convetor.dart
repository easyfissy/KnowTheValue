import 'package:flutter/material.dart';


class Curencyconvetor extends StatefulWidget{
  const Curencyconvetor({super.key});
  @override
  State<Curencyconvetor> createState()=>_Currencyconvertor();
  }

  class _Currencyconvertor extends State<Curencyconvetor>{
  double? result;
  String? selectedCurrency;

  final Map<String, double> rates = {
    'None' : 0,
    'USD': 0.012,
    'Pound': 0.0087,
    'Euro': 0.010,
  };
    @override
    void initState() {
    super.initState();
  }
 @override
   Widget build(BuildContext context){
    final TextEditingController texteditingcontroller = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Color.fromRGBO(4, 101, 12, 1),
        appBar: AppBar(
          excludeHeaderSemantics:true,
          centerTitle: true,
          elevation:0,
          title: Text('Currency Convertor',
          style:TextStyle(fontWeight:FontWeight.w600,fontSize: 30),
          ),
          backgroundColor:Colors.transparent,
          foregroundColor:Colors.black,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          flexibleSpace: Container(
            decoration:BoxDecoration(
              gradient: RadialGradient(
                colors: [const Color.fromARGB(255, 180, 191, 197),const Color.fromARGB(221, 15, 18, 23)],
              center:Alignment.bottomLeft,
              radius: 20,
              ),
            ),
          ),
         leading:Icon(Icons.menu),
        ),
        extendBodyBehindAppBar: false,
        body:Stack(
          children: [
            ColorFiltered(colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(123),
              BlendMode.darken
            )
            ),
              Positioned.fill(
          child: Image.asset(
            "assets/2.png",//the background image
            fit: BoxFit.fill,
          ),
        ),
          
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[const Color.fromARGB(255, 180, 191, 197),const Color.fromARGB(221, 15, 18, 23)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              )
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10), //image here
                    child: Image.asset(
                      "assets/app_logo.png",//the app logo image
                      height:250,
                      ),
                  ),
                    SizedBox(height:20),
                   Text(
                    result == null
                        ? 'Converted amount will appear here'
                        : '$selectedCurrency ${result!. toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      obscureText: false,//use to make the text like password 
                      controller: texteditingcontroller,
                      textAlignVertical: TextAlignVertical(y:0.5),
                      autocorrect: true,
                      style:TextStyle(color:Color.fromARGB(255, 1, 1, 1)),
                      decoration:InputDecoration(
                        // labelStyle:TextStyle(color:Color.fromARGB(220, 225, 220, 330)),
                        hint:Text('Enter the AMOUNT in INR',
                        style:TextStyle(
                        color: Color.fromRGBO(16, 13, 13, 1)
                        ),
                      ),
                
                        prefixIcon: Icon(Icons.monetization_on_outlined),//Important for the icon part
                        prefixIconColor:Color.fromARGB(255, 1, 1, 1), 
                         filled: true,
                         fillColor: const Color.fromARGB(255, 180, 169, 204),
                         focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(width:0.001,style:BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                         ),
                
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width:0.001,style:BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                    
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                  ), 
                  Container(
                    margin:EdgeInsetsGeometry.directional(start:10,end:10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                     color: Colors.blue[300],
                     borderRadius: BorderRadius.circular(12),
                     ),
                  child: DropdownButton<String>(
                    hint: Center(child: Text('Choose the currency to convert')),
                    dropdownColor:Color.fromRGBO(130, 154, 206, 1),
                    isExpanded: true,
                    elevation: 0,
                    value: selectedCurrency,
                    items: rates.keys.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Center(child:(Text(currency)),)
                        
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency = newValue!;
                      });
                    },
                  ),
                ),
                  
                     Padding(
                       padding: const EdgeInsets.all(10),
                       child: TextButton(
                        onPressed: (){
                          double rate =rates[selectedCurrency]!;
                          setState(() {
                            result= double.parse(texteditingcontroller.text)*rate;// the value of $1 = INR 81
                          });
                         
                          },
                          style:TextButton.styleFrom(
                            backgroundColor:Colors.black,
                            minimumSize: Size(double.infinity, 20),
                            foregroundColor: Colors.blue[300],
                           
                          ),
                          child:const Text('Convert',style:TextStyle(color:Color.fromARGB(255, 255, 255, 255)),),
                               ),
                     ),
                 ],
                        
                ),
              ),
            ),
          ),
          ],
          )
        )
      );
    }
  }
