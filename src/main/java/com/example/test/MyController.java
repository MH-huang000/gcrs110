package com.example.test;

import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class MyController {

    @Autowired
    // private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private NamedParameterJdbcTemplate database;

    @RequestMapping("/P")
    public String P() {
        String sql = "SELECT * FROM account WHERE 1";
        Map<String, Integer> map = new HashMap<>();
        map.put("l", 1);
        List<Map<String, Object>> results = database.queryForList(sql, map);
        System.out.println(results.get(0).get("user_ID"));
        return "hi";
    }
}
