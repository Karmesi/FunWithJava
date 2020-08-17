/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class BMIMapper implements RowMapper<BMI> {

    @Override
    public BMI mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new BMI(
                rs.getString("dateTake"),
                rs.getFloat("rangeBMI"),
                rs.getFloat("height"),
                rs.getFloat("weight"),
                rs.getInt("age"),
                rs.getInt("idUser"));
    }
}
