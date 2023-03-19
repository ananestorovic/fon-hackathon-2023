import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pet.dart';
import 'package:image_picker/image_picker.dart';

class CreateRequestPage extends StatefulWidget  {
  const CreateRequestPage({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<StatefulWidget> createState() => _CreateRequestState();
}
class _CreateRequestState extends State<CreateRequestPage>  with RestorationMixin{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDateStart =
  RestorableDateTime(DateTime(2021, 7, 25));
  
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFutureStart =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDateStartFunc,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDateStart.value.millisecondsSinceEpoch,
      );
    },
  );

  final RestorableDateTime _selectedDateEnd =
  RestorableDateTime(DateTime(2021, 7, 25));

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFutureEnd =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDateEndFunc,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDateEnd.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDateStart, 'selected_date_start');
    registerForRestoration(
        _restorableDatePickerRouteFutureStart, 'date_picker_route_future_start');
    registerForRestoration(_selectedDateEnd, 'selected_date_end');
    registerForRestoration(
        _restorableDatePickerRouteFutureEnd, 'date_picker_route_future_end');
  }

  void _selectDateStartFunc(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDateStart.value = newSelectedDate;
        String dateString = '${_selectedDateStart.value.day}/${_selectedDateStart.value.month}/${_selectedDateStart.value.year}';
        startDateDescr = dateString;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: $dateString'),
        ));
      });
    }
  }

  void _selectDateEndFunc(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDateEnd.value = newSelectedDate;
        String dateString = '${_selectedDateEnd.value.day}/${_selectedDateEnd.value.month}/${_selectedDateEnd.value.year}';
        endDateDescr = dateString;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected:$dateString'),
        ));
      });
    }
  }

   String startDateDescr = 'Choose start date';
   String endDateDescr = 'Choose end date';
  String reason = "";
  String species = "";
   File? _image;

   String note="";
  @override
  Widget build(BuildContext context) {
    dropDownCallback(value) {
      reason = value;
    }
    dropDownCallback2(value) {
      species = value;
    }
    DropdownButtonExample dropdownButtonExample = DropdownButtonExample(dropDownCallback);
    DropdownButtonExampleCategory dropdownButtonExampleCategory =  DropdownButtonExampleCategory(dropDownCallback2);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.name, // Use email input type for emails.
                    onChanged: (value) {note = value;},
                    decoration:  const InputDecoration(
                        labelText: 'Request description'
                    )
                ),
                dropdownButtonExample,
                dropdownButtonExampleCategory
                ,
                OutlinedButton (
                onPressed: () {
                  _restorableDatePickerRouteFutureStart.present();
                },
                child:  Text(startDateDescr),
              ),
                OutlinedButton (
                  onPressed: () {
                    _restorableDatePickerRouteFutureEnd.present();
                  },
                  child: Text(endDateDescr),
                ),
                SizedBox(
                  width: screenSize.width,
                  child:  FilledButton(
                    onPressed: () async {
                      XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        if (image != null){
                          _image = File(image.path);
                        }
                      });
                      },
                    child:  const Text(
                      'Choose image',
                      style:  TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
            _image != null
                ? Image.file(
              _image!,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.fitHeight,
            )
                : Container(
              decoration: BoxDecoration(
                  color: Colors.red[200]),
              width: 200,
              height: 200,
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey[800],
              ),
            ),
                FilledButton(onPressed:() {
                  print(reason);
                  print(species);
                }, child:const Text(
                  'Create request',
                  style:  TextStyle(
                      color: Colors.white
                  ),
                ),)
              ],
            ),
          )
      ),
    );
  }
}


typedef DropDownCallback = void Function(String value);

class DropdownButtonExample extends StatefulWidget {

 DropDownCallback onValueSelect;

  DropdownButtonExample(this.onValueSelect, {super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState(onValueSelect);

}

List<String> list = Condition.values.map((e) => e.name).toList();



class _DropdownButtonExampleState extends State<DropdownButtonExample> {


  final DropDownCallback onValueSelect;
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          onValueSelect(dropdownValue);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _DropdownButtonExampleState(this.onValueSelect);
}




class DropdownButtonExampleCategory extends StatefulWidget {

  DropdownButtonExampleCategory(this.onValueSelect, {super.key});

  DropDownCallback onValueSelect;

  @override
  State<DropdownButtonExampleCategory> createState() => _DropdownButtonExampleCategoryState(onValueSelect);
}
List<String> list2 = Category.values.map((e) => e.name).toList();

class _DropdownButtonExampleCategoryState extends State<DropdownButtonExampleCategory> {
  String dropdownValue = list2.first;
  final DropDownCallback onValueSelect;

  _DropdownButtonExampleCategoryState(this.onValueSelect);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          onValueSelect(dropdownValue);
        });
      },
      items: list2.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

