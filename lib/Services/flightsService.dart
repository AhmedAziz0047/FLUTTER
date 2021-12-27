import 'package:http/http.dart' as http; 
class api_manager{
  void getFlights() async{
    var res=http.Client();
    var flights=await res.get(Uri.parse('http://localhost:3000/api/getFlights'));
    if (flights.statusCode==200){
      var flightsRes=flights.body;
    }
  }
}