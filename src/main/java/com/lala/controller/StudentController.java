package com.lala.controller;

import com.lala.domain.Student;
import com.lala.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService service;
    //注册学生
    @RequestMapping("/addStudent.do")
    public ModelAndView addStudent(Student student){
        ModelAndView mv=new ModelAndView();
        String tips="注册失败";
        //调用service处理student
        int nums=service.addStudent(student);
        if (nums>0){
            //注册成功
            tips="学生【"+student.getName()+"】注册成功！";
        }
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }
    @RequestMapping("/queryStudent.do")
    @ResponseBody
    public List<Student> queryStudent(){
        //参数检查，简单的数据处理
        List<Student> students=service.findStudents();
        return students;
    }
    @RequestMapping("/deleteStudent.do")
    public String setStudent(Model model,int id){
        int r=service.delStudent(id);
        model.addAttribute("tips",r==1 ? "删除成功" : "删除失败");
        return "result";
    }
    @RequestMapping("updateStudent.do")
    public String updateStudent(Model model,Student student){
        int r=service.updStudent(student);
        model.addAttribute("tips",r==1 ? "修改成功" : "修改失败");
        return "result";
    }
    @RequestMapping("queryStudentOne.do")
    @ResponseBody
    public Student queryStudentOne(int id){

        return service.findStudent(id);
    }
}
