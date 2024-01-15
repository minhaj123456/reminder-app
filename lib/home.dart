// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:task/constants.dart';
import 'package:task/newpage.dart';

class homepages extends StatelessWidget {
  const homepages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const topcontainer(),
            SizedBox(
              height: 2.h,
            ),
            const Flexible(child: bottomcontainer())
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const newpage(),
              ));
        },
        child: SizedBox(
          width: 18.w,
          height: 9.h,
          child: Card(
            color: kPrimaryColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(3.h),
            ),
            child: Icon(
              Icons.add_outlined,
              color: kScaffoldColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class topcontainer extends StatelessWidget {
  const topcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            "worry less.\nlive healthier.",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline2!.copyWith(color: kTextColor),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            "daily activity",
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            "0",
            style: Theme.of(context).textTheme.headline5,
          ),
        )
      ],
    );
  }
}

class bottomcontainer extends StatelessWidget {
  const bottomcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     "workout",
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headline3,
    //   ),
    // );
    return GridView.builder(
      padding: const EdgeInsets.only(top: 1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context,index){
        return const Card1(
         
        );

        

      },

      

     
    );
  }
}
class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       highlightColor: Colors.white,
          splashColor: Colors.grey,
          onTap: () {
            
          },
          child: Container(
             padding: const EdgeInsets.only(left:2,
              right: 2,
              top: 1,bottom: 1),
          margin: const EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/bottle.svg",
                height: 7.h,
                color: kOtherColor,
              ),
              const Spacer(),
              Text(
                "heee",
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 0.3,
              ),
              Text(
                "every 12 hours",
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          )
          ),
    );
  }
}