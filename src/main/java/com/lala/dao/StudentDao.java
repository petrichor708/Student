package com.lala.dao;

import com.lala.domain.Student;

import java.util.List;

public interface StudentDao {
    int insertStudent(Student student);
    List<Student> selectStudents();
    int updateStudent(Student student);
    int deleteStudent(int id);
    Student selectStudent(int id);
}
