import 'dart:convert';
import 'dart:ffi';

import 'package:covid_to_day/model/covid_to_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

// Future<List<CovidToDay>> fetchCovid() async {
//   List<CovidToDay> covidList = [];
//   final response = await http.get(
//       Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));
//   print(response.body);
//   if (response.statusCode == 200) {
//     var jsonList = jsonDecode(response.body);
//     for (var covid in jsonList) {
//       covidList.add(CovidToDay.fromJson(covid));
//     }
//     return covidList;
//   } else {
//     throw Exception('Failed to load Data');
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late List<CovidToDay> futureCovid;
  // @override
  // void initState() {
  //   WidgetsBinding.instance?.addPostFrameCallback((_) async {
  //     futureCovid = await fetchCovid();
  //     print(futureCovid);
  //   });
  //   super.initState();
  // }
  late Future<CovidToDay> futureCovidToDay;
  @override
  void initState() {
    super.initState();
    futureCovidToDay = fetchCovid();
  }

  Future<CovidToDay> fetchCovid() async {
    final response = await http.get(
        Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));
    final jsonresponse = json.decode(response.body);
    print(response.body);
    return CovidToDay.fromJson(jsonresponse[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 50.h),
            titleCovid(),
            SizedBox(height: 10.h),
            doctor(),
            SizedBox(height: 10.h),
            dayData(),
            SizedBox(height: 10.h),
            caseData(),
            SizedBox(height: 10.h),
            recoveredData(),
            SizedBox(height: 10.h),
            deathsData(),
          ],
        ),
      ),
    );
  }

  Row caseData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.red.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'New Case',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.new_case.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.red,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'Total Case',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.new_case);
                      return Text(
                        snapshot.data!.total_case.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row recoveredData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.green,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'New Recovered',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.new_recovered.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.green.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'Total Recovered',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.total_recovered.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row deathsData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'New Deaths',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.new_death.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'Total Deaths',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.total_death.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container dayData() {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: Color(0xffF49E6F)),
      child: Center(child: FutureBuilder<CovidToDay>(
                  future: futureCovidToDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        'Update To ${snapshot.data!.update_date.toString()}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),),
    );
  }

  Container doctor() {
    return Container(
      width: double.infinity,
      height: 165.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 335.w,
              height: 141.h,
              decoration: BoxDecoration(
                  color: Color(0xffCFE3FC),
                  borderRadius: BorderRadius.circular(30.r)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10.w,
            child: Container(
              width: 158.w,
              height: 164.h,
              child: Image.asset(
                'assets/images/doc.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: Container(
              width: 159.w,
              height: 69.h,
              child: Text(
                'Know safety tips and precautions from top Doctors.',
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container titleCovid() {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.orangeAccent,
      ),
      child: Center(
        child: Text(
          'Covid-19 To Day',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp),
        ),
      ),
    );
  }
}
