package com.school.jtestjava;

public class GeometricFiguresClass {
    private double squareSide = 0.0;
    private double circleArea = 0.0;

    public GeometricFiguresClass(double squareSide, double circleArea) {
        try {
            this.squareSide = squareSide;
            this.circleArea = circleArea;
        } catch (Exception e) {
            System.out.println("Wrong! (GeometricFiguresClass)");
        }
    }

    public String getSquareArea() {
        if (this.squareSide <= 0.0) {
            return "Error while calculating the Area of the Square";
        }
        return "The area is: " + (this.squareSide * this.squareSide);
    }

    public String getCircleDiameter() {
        if (this.circleArea <= 0.0) {
            return "Error while calculating the Diameter of the Circle";
        }
        Double value = this.circleArea / Math.PI;
        value = Math.sqrt(value);
        return "The diameter is: " + (2 * value);
    }
}
