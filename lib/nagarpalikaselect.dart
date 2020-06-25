
import 'package:flutter/material.dart';

class Nagarpalika extends StatefulWidget {
  final String title = "Select Nagarpalika";

  @override
  NagarpalikaState createState() => NagarpalikaState();
}

class Provision {
  int id;
  String name;

  Provision(this.id, this.name);

  static List<Provision> getProvision() {
    return <Provision>[
      Provision(1, 'Nepal'),
      Provision(2, 'Nepal-2'),
      Provision(3, 'Nepal-3'),
      Provision(4, 'Nepal-4'),
      Provision(5, 'Nepal-5'),
      Provision(6, 'Nepal-6'),
      Provision(7, 'Nepal-7'),
    ];
  }
}

class NagarpalikaState extends State<Nagarpalika> {
  //
  List<Provision> _provision = Provision.getProvision();
  List<DropdownMenuItem<Provision>> _dropdownMenuItems;
  Provision _selectedProvision;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_provision);
    _selectedProvision = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Provision>> buildDropdownMenuItems(List provision) {
    List<DropdownMenuItem<Provision>> items = List();
    for (Provision provision in provision) {
      items.add(
        DropdownMenuItem(
          value: provision,
          child: Text("${provision.name}"),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Provision selectedProvision) {
    setState(() {
      _selectedProvision = selectedProvision;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 112, 184, 1),
        body: SafeArea(
                  child: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:8.0,top: 10.0),
            child: Text(
              "आफ्नो नगरपालिका ‍छान्नुहोस् ",
              style: TextStyle(
                
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          ListTile(
            isThreeLine: false,
            leading: Icon(Icons.account_balance,color: Colors.white,size: 25,),
            title: Text("लुम्बिनी सांस्कृतिक नगरपालिका",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
            onTap: () => Navigator.pushNamed(context, 'homepage',arguments: 1),
          )
      ],
    ),
          ),
        ),
      );
  }
}
