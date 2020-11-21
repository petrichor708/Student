package com.lala.service.Impl;

import com.lala.dao.StudentDao;
import com.lala.domain.Student;
import com.lala.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentServiceImpl implements StudentService {
    //引用类型自动注入@Autowired，@Resource
    @Autowired
    private StudentDao studentDao;

    @Override
    public Student findStudent(int id) {
        return studentDao.selectStudent(id);
    }

    public int addStudent(Student student) {
        int nums=studentDao.insertStudent(student);
        return nums;
    }

    @Override
    public int delStudent(int id) {
        return studentDao.deleteStudent(id);
    }

    @Override
    public List<Student> findStudents() {
        return studentDao.selectStudents();
    }

    @Override
    public int updStudent(Student student) {
        return studentDao.updateStudent(student);
    }
}
