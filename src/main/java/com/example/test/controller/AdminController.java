package com.example.test.controller;

import java.util.List;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.test.entity.Account;
import com.example.test.entity.Student;
import com.example.test.service.AccountService;
import com.example.test.service.StudentService;

@Controller
@RequestMapping("/admins")
public class AdminController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private AccountService accountService;

    @GetMapping("/index")
    public String getMethodName() {
        String neame = SecurityContextHolder.getContext().getAuthentication().getName();
        String deparmentId = accountService.getDeparmentIdOfAccount(neame);
        int year = LocalDate.now().getYear();// 西元
        if (LocalDate.now().getMonthValue() > 6) {
            year++;
        }
        return "admin/index";
    }

    @GetMapping("/lsit")
    public String adminIndex(Model model, @RequestParam int type, @RequestParam int year) {
        String neame = SecurityContextHolder.getContext().getAuthentication().getName();
        String deparmentId = accountService.getDeparmentIdOfAccount(neame);
        // List<Student> students = studentService.getStudents(type, );
        // model.addAttribute("students", students);
        return "admin/review";
    }

}
