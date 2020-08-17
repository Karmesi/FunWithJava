package com.school.jtestjava;

public class MathClass {

    private int number = 0;

    public MathClass(int number) {
        try {
            this.number = number;
        } catch (Exception e) {
            System.out.println("Wrong! StringsClass");
        }
    }

    public String isPrimeNumber() {
        if (this.number <= 1) {
            return this.number + " is not prime";
        }

        for (int i = 2; i < this.number; i++) {
            if (this.number % i == 0) {
                return this.number + " is not prime";
            }
        }
        return this.number + " is prime";
    }
}
