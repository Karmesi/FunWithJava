/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

public class BMI {
    private String dateTake;
    private Float rangeBMI, height, weight;
    private Integer age, idUser;

    public BMI(String dateTake, Float rangeBMI, Float height, Float weight, Integer age, Integer idUser) {
        this.dateTake = dateTake;
        this.rangeBMI = rangeBMI;
        this.height = height;
        this.weight = weight;
        this.age = age;
        this.idUser = idUser;
    }

    public String getDateTake() {
        return dateTake;
    }

    public void setDateTake(String dateTake) {
        this.dateTake = dateTake;
    }

    public Float getRangeBMI() {
        return rangeBMI;
    }

    public void setRangeBMI(Float rangeBMI) {
        this.rangeBMI = rangeBMI;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    
}
