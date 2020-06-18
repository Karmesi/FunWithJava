/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mathapp.jspmath;

/**
 *
 * @author karmesi
 */
public class Triangulo {
    private double base = 0;
    private double altura = 0;

    public double getArea() {
        if (base <= 0.0 || altura <= 0.0) {
            return 0;
        }

        return (this.base * this.altura) / 2;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
}
