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
    private double base = 0.0;
    
    private double altura = 0.0;

    public double getAltura() {
        return this.altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double getArea() {
        if (this.base <= 0.0 || this.altura <= 0.0) {
            return 0;
        }

        return (this.base * this.altura) / 2;
    }

    public double getPerimetro() {
        if (this.base <= 0.0) {
            return 0;
        }

        return this.base * 3;
    }

    public double getBase() {
        return this.base;
    }

    public void setBase(double base) {
        this.base = base;
    }
}
