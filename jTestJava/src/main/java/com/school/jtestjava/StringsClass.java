package com.school.jtestjava;

public class StringsClass {

    private String text = "";
    private String mayus = "";
    private String numbers = "";

    public StringsClass(String text) {
        try {
            this.text = text;
            this.calculate();
        } catch (Exception e) {
            System.out.println("Wrong! StringsClass");
        }
    }

    private void calculate() {
        for (int i = 0; i < this.text.length(); i++) {
            char single = this.text.charAt(i);
            if (Character.isDigit(single)) {
                this.numbers += this.text.charAt(i);
            }
            if (Character.isUpperCase(single)) {
                this.mayus += this.text.charAt(i);
            }
        }
    }

    public String getNumbersOnText() {
        return "The text has " + this.numbers.length() + " numbers (" + this.numbers + ")";
    }

    public String getMayusOnText() {
        return "The text has " + this.mayus.length() + " upper case letters (" + this.mayus + ")";
    }
}
