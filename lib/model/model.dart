class Student {
  final String firstname,
      lastname,
      reg_id,
      father,
      mother,
      gender,
      caste,
      symbol_no,
      dob_year,
      dob_mon,
      dob_day,
      school_name;
  final int id, school_id, year;

  Student({
    this.reg_id,
    this.firstname,
    this.lastname,
    this.mother,
    this.gender,
    this.caste,
    this.school_id,
    this.year,
    this.dob_year,
    this.dob_mon,
    this.dob_day,
    this.symbol_no,
    this.father,
    this.school_name,
    this.id,
  });

  factory Student.fromJson(Map<String, dynamic> data) {
    return Student(
        firstname: data["first_name"],
        lastname: data["last_name"],
        father: data["fathers_name"],
        mother: data["mothers_name"],
        gender: data["sex"],
        caste: data["caste"],
        symbol_no: data["symbol_no"],
        id: data["id"],
        school_id: data["School_ID"],
        year: data["year"],
        dob_day: data["dob_day"],
        dob_year: data["dob_year"],
        dob_mon: data["dob_month"],
        school_name: data["school"],
        reg_id: data["reg_id"]);
  }
}

class Studentdata {
  final Student student;
  final List<Udata> udata;
  final dynamic avggpa, status, message,finalgrade;

  Studentdata({this.finalgrade, 
    this.status,
    this.message,
    this.avggpa,
    this.student,
    this.udata,
  });
  factory Studentdata.fromJson(Map<String, dynamic> data) {
    List<Udata> catlist ;
    Student student;
    print(data["subject_grades"]);
    print(data["final_grade"]);

    var grades = data['subject_grades'] as List;
    var student_data = data['student'];
    if (grades != null) {
     catlist = grades.map((f) => Udata.fromJson(f)).toList();
    }
    if(student_data != null){
      student=Student.fromJson(student_data);
    }

    print(data["status"]);
    print(data["message"]);

    return (Studentdata(
        student: student,
        udata: catlist,
        finalgrade: data["final_grade"],
        avggpa: data["avg_gpa"],
        status: data["status"],
        message: data["message"]));
  }
}

class Nagarpalikaname {
  final dynamic nagarnames;

  Nagarpalikaname({this.nagarnames});
  factory Nagarpalikaname.fromJson(Map<String, dynamic> names) {
    return (Nagarpalikaname(nagarnames: names["status"]));
  }
}

class Udata {
  final dynamic gpa;
  final dynamic credit, name, lable, grade;

  Udata({
    this.credit,
    this.gpa,
    this.name,
    this.lable,
    this.grade,
  });

  factory Udata.fromJson(Map<String, dynamic> data) {
   // print("udata ko ho");
    //print(data);
    return Udata(
        credit: data["credit"],
        gpa: data["gpa"],
        name: data["name"],
        lable: data["label"],
        grade: data["grade"]);
  }
}
