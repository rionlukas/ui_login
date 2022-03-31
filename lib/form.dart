import 'package:flutter/material.dart';

class formScreen extends StatefulWidget {
  const formScreen({Key? key}) : super(key: key);

  @override
  State<formScreen> createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  bool checkedValue = false;
  String _selectedGender ='male';
  List<String> dropDownList = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
  var selectedDropDown;
  
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validasi Text Edit"),
      ),
      body: Container(
        child: Column(
            children: [
              const SizedBox(height: 20,),
              Text("Contoh Checkbox"),
              CheckboxListTile(
                title: Text("Setuju"),
                value: checkedValue,
                onChanged: (newValue){
                  setState(() {
                    checkedValue = newValue!;
                    print(newValue);
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 16,),
              
              Text("Contoh Radio Button"),
              
              ListTile(
                leading: Radio<String>(
                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value){
                    setState(() {
                      _selectedGender = value!;
                    }); 
                  },
                ),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value){
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Female'),
              ),
              SizedBox(height: 16,),
              Text("Contoh Dropdown"),
              DropdownButton(
                isExpanded: true,
                hint: Text("Silahkan pilih hari"),
                value: selectedDropDown,
                onChanged: (newValue){
                  setState(() {
                    print(newValue.toString());
                    selectedDropDown = newValue;
                  });
                },
                items: dropDownList.map((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
        ),
      ),
    );
  }
}
