// //writing code simple flutter screen with appbar and textfield and button

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:googleapis/servicemanagement/v1.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TraningScreen extends StatefulWidget {
//   const TraningScreen({super.key});
//   @override
//   TraningScreenState createState() => TraningScreenState();
// }

// class TraningScreenState extends State<TraningScreen> {
//   bool isButtonPressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Traning for Nix Test'),
//       ),
//       body: isButtonPressed
//           ? Container()
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [Text('you click the button successfuly!')],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             isButtonPressed = true;
//           });
//         },
//       ),
//     );
//   }
// }

// //function to fetch data from API with http

// featchData() {
// try{  final res = http.get(Uri.parse(url));
//   if(res.statuscode =200 || res.statuscode =201){
//     return final data = jsonDecode(res.body);
//     }catch(e){

// }


//   }
// }




// Navigator.push(
//   context,
//   MaterialPAgeRoute(Builder : (_)=> Screen(data :data))
// )


// class CounterIncrese extends ChangeNotifier {
//   int counter = 0;
//   inc(){
//     counter++;
//     notifyListeners();
//   }
// }



// final shardePref = await SharedPreferences.getInstance();

// await  shardePref.setInt("Counter" , counter);
// await final counter =  shardePref.getInt("Counter") ?? 0;




// ListView.builder(
//   ItemCount : 20 ,
//   ItemBuilder: (context,index){
//     return card(
//       child : ListTile(
//         title: T,
//       )
//     )
//   }

// )



// FutureBuilder (
// future : DataSouces().getFutureData() ,
// builder : (contect , snapshot){
//   if(snapshot = 200 ){
//     if(snapshot.data =! null){
//       return DataWidget(snapshot.data)
//     }
//     return text('no Data');
//   }else{
//      return new CircularProgressIndicator();
//   }


// } , 

// )




