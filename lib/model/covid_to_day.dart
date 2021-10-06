class CovidToDay {
  final int new_case;
  final int total_case;
  final int new_recovered;
  final int total_recovered;
  final int new_death;
  final int total_death;
  final DateTime update_date; 
  CovidToDay({
    required this.new_case,
    required this.total_case,
    required this.new_recovered,
    required this.total_recovered,
    required this.new_death,
    required this.total_death,
    required this.update_date,
  });
  factory CovidToDay.fromJson(Map<String, dynamic> covidjson) => CovidToDay(
        new_case: covidjson['new_case'],
        total_case: covidjson['total_case'],
        new_recovered: covidjson['new_recovered'],
        total_recovered: covidjson['total_recovered'],
        new_death: covidjson['new_death'],
        total_death: covidjson['total_death'],
        update_date: DateTime.parse(covidjson['update_date']),
      );
}

// import 'dart:convert';

// class CovidToDay {
//   final int new_case;
//   final int total_case;
//   final int new_recovered;
//   final int total_recovered;
//   final int new_death;
//   final int total_death;
//   CovidToDay({
//     required this.new_case,
//     required this.total_case,
//     required this.new_recovered,
//     required this.total_recovered,
//     required this.new_death,
//     required this.total_death,
//   });

//   CovidToDay copyWith({
//     int? new_case,
//     int? total_case,
//     int? new_recovered,
//     int? total_recovered,
//     int? new_death,
//     int? total_death,
//   }) {
//     return CovidToDay(
//       new_case: new_case ?? this.new_case,
//       total_case: total_case ?? this.total_case,
//       new_recovered: new_recovered ?? this.new_recovered,
//       total_recovered: total_recovered ?? this.total_recovered,
//       new_death: new_death ?? this.new_death,
//       total_death: total_death ?? this.total_death,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'new_case': new_case,
//       'total_case': total_case,
//       'new_recovered': new_recovered,
//       'total_recovered': total_recovered,
//       'new_death': new_death,
//       'total_death': total_death,
//     };
//   }

//   factory CovidToDay.fromMap(Map<String, dynamic> map) {
//     return CovidToDay(
//       new_case: map['new_case'],
//       total_case: map['total_case'],
//       new_recovered: map['new_recovered'],
//       total_recovered: map['total_recovered'],
//       new_death: map['new_death'],
//       total_death: map['total_death'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CovidToDay.fromJson(String source) => CovidToDay.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'CovidToDay(new_case: $new_case, total_case: $total_case, new_recovered: $new_recovered, total_recovered: $total_recovered, new_death: $new_death, total_death: $total_death)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is CovidToDay &&
//       other.new_case == new_case &&
//       other.total_case == total_case &&
//       other.new_recovered == new_recovered &&
//       other.total_recovered == total_recovered &&
//       other.new_death == new_death &&
//       other.total_death == total_death;
//   }

//   @override
//   int get hashCode {
//     return new_case.hashCode ^
//       total_case.hashCode ^
//       new_recovered.hashCode ^
//       total_recovered.hashCode ^
//       new_death.hashCode ^
//       total_death.hashCode;
//   }
// }
