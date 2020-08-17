/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Models.BMIMapper;
import Models.SQLconection;
import Models.User;
import Models.UserMapper;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class SingleService {

    private JdbcTemplate jt;

    public SingleService() {
        SQLconection cn = new SQLconection();
        jt = new JdbcTemplate(cn.Conexion());
    }

    public List<User> userLogin(String username, String password) {
        return jt.query(
            "select * from User where username = ? and password = ?",
            new Object[] {username, password},
            new UserMapper()
        );
    }
    
    public List userHistory(String username) {
        return jt.query(
            "select * from BMI where idUser = (select idUser from User where username = ?)",
            new Object[] {username},
            new BMIMapper()
        );
    }

    //username, password, firstName, middleName, lastName, gender, height, weight, age
    public void userRegister(
            String username,
            String password,
            String firstName,
            String middleName,
            String lastName,
            String gender,
            Float height,
            Float weight,
            Integer age) {
        jt.update(
            "insert into User(username, password, firstName, middleName, lastName, gender, height, weight, age)"
            + "values (?, ?, ?, ?, ?, ?, ?, ?, ?)",
            new Object[] {username, password, firstName, middleName, lastName, gender, height, weight, age}
        );
    }
    
    public void bmiRegister(
            String username,
            String dateTake,
            Float rangeBMI,
            Float height,
            Float weight,
            Integer age
    ) {
        jt.update(
            "insert into BMI(dateTake, rangeBMI, height, weight, age, idUser)"
            + "values (?, ?, ?, ?, ?, ("
            + "select idUser from User where username = ?"
            + "))",
            new Object[] {dateTake, rangeBMI, height, weight, age, username}
        );
    }
}
