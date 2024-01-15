import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:task/constants.dart';
import 'package:task/converttime.dart';
import 'package:task/entry_blok.dart';
import 'package:task/timetable.dart';
import 'package:provider/provider.dart';



//

class newpage extends StatefulWidget {
  const newpage({super.key});

  @override
  State<newpage> createState() => _newpageState();
}

class _newpageState extends State<newpage> {
  late TextEditingController namecontroller;
  late TextEditingController remindercontroller;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldkey;

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    remindercontroller.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController();
    remindercontroller = TextEditingController();
    _newEntryBloc =NewEntryBloc();
    _scaffoldkey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("add new"),
      ),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const paneltitle(
                title: "reminder",
                isrequired: true,
              ),
              TextFormField(
                maxLength: 12,
                controller: namecontroller,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: kOtherColor),
              ),
              const paneltitle(
                title: "walking",
                isrequired: false,
              ),
              TextFormField(
                maxLength: 12,
                controller: remindercontroller,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: kOtherColor),
              ),
              SizedBox(
                height: 2.h,
              ),
              const paneltitle(title: "work", isrequired: false),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: StreamBuilder <sceduletime3>(
                  stream: _newEntryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sceduletime1(
                            sceduletime: sceduletime3.teaTime,
                            name: 'teatime',
                            iconvalue: 'assets/icons/bottle.svg',
                            isSelected: snapshot.data == sceduletime3.teaTime
                                ? true
                                : false),
                        sceduletime1(
                            sceduletime: sceduletime3.teaTime,
                            name: 'Gym',
                            iconvalue: 'assets/icons/bottle.svg',
                            isSelected:
                                snapshot.data == sceduletime3.Gym ? true : false),
                        sceduletime1(
                            sceduletime: sceduletime3.teaTime,
                            name: 'reading',
                            iconvalue: 'assets/icons/bottle.svg',
                            isSelected: snapshot.data == sceduletime3.Reading
                                ? true
                                : false),
                        sceduletime1(
                            sceduletime: sceduletime3.teaTime,
                            name: 'meeting',
                            iconvalue: 'assets/icons/bottle.svg',
                            isSelected: snapshot.data == sceduletime3.Meeting
                                ? true
                                : false),
                      ],
                    );
                  },
                ),
              ),
              const paneltitle(title: "intervals", isrequired: true),
              const intervals(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: paneltitle(title: 'starting Time', isrequired: true),
              ),


              selectTime(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: SizedBox(
                  width: 80.w,
                  height: 8.h,
                  child: TextButton(style:TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: StadiumBorder()
                  ),
                  child:Center(
                    child: Text("confirm",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kScaffoldColor,
                      ),),
                  ),
                  onPressed: (){ 

      
                  }
                )
                      ),
              )],
          ),
        ),
      ),
    );
  }
}

class selectTime extends StatefulWidget {
  const selectTime({super.key});

  @override
  State<selectTime> createState() => _selectTimeState();
}

class _selectTimeState extends State<selectTime> {
   TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
   bool _clicked = false;
  Future<TimeOfDay> _selected() async{
    final TimeOfDay? picked =await showTimePicker(
      context: context, initialTime: _time );


      if(picked !=null && picked != _time){
        setState(() {
          
          _time = picked;
          _clicked =true;
        }
        );
      }
      return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor, shape: StadiumBorder()),
            onPressed: () {
              _selected();
            },
            child: Center(
              child: Text(
                _clicked ==false
                ?
                'select Time': "${convertTime(_time.hour.toString())}: ${convertTime(_time.minute.toString())}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: kScaffoldColor),
              ),
            )),
      ),
    );
  }
}

class intervals extends StatefulWidget {
  const intervals({super.key});

  @override
  State<intervals> createState() => _intervalsState();
}

class _intervalsState extends State<intervals> {
  final _intervals = [
    6,
    8,
    12,
    24,
  ];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'remind me every',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          DropdownButton(
            iconEnabledColor: kOtherColor,
            dropdownColor: kScaffoldColor,
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    "select an interval",
                    style: Theme.of(context).textTheme.caption,
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: kSecondaryColor),
                  ),
                );
              },
            ).toList(),
            onChanged: (newval) {
              setState(() {
                _selected = newval!;
              });
            },
          ),
          Text(
            _selected == 1 ? "hour" : "hours",
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}

class sceduletime1 extends StatelessWidget {
  const sceduletime1(
      {super.key,
      required this.sceduletime,
      required this.name,
      required this.iconvalue,
      required this.isSelected});
  final sceduletime3 sceduletime;
  final String name;
  final String iconvalue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        newEntryBloc.updateSelectedMedicine(sceduletime);
      },
      child: Column(
        children: [
          Container(
            width: 20.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: isSelected ? kOtherColor : Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: SvgPicture.asset(
                  iconvalue,
                  height: 7.h,
                  color: isSelected ? Colors.white : kOtherColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Container(
              width: 20.w,
              height: 4.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? kOtherColor : Colors.white),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: isSelected ? Colors.white : kOtherColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class paneltitle extends StatelessWidget {
  const paneltitle({super.key, required this.title, required this.isrequired});

  final String title;
  final bool isrequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(
              text: isrequired ? " *" : "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: kPrimaryColor,
                  )),
        ]),
      ),
    );
  }
}
