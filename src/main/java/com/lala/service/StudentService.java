package com.lala.service;

import com.lala.domain.Student;

import java.util.List;

public interface StudentService {
    int addStudent(Student student);
    List<Student> findStudents();
    Student findStudent(int id);
    int delStudent(int id);
    int updStudent(Student studnt);
}
