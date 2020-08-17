package com.school.jtestjava;

import junit.framework.*;

public class GeometricFiguresClassTest extends TestCase{

    public void testGetSquareArea() {
        System.out.println("getSquareArea");
        GeometricFiguresClass instanceTrue = new GeometricFiguresClass(5, 0);
        GeometricFiguresClass instanceFalse = new GeometricFiguresClass(-1, 0);
        assertEquals("The area is: 25.0", instanceTrue.getSquareArea());
        assertEquals("Error while calculating the Area of the Square", instanceFalse.getSquareArea());
    }

    public void testGetCircleDiameter() {
        System.out.println("getCircleDiameter");
        GeometricFiguresClass instanceTrue = new GeometricFiguresClass(0, 41.5);
        GeometricFiguresClass instanceFalse = new GeometricFiguresClass(0, -1);
        assertEquals("The diameter is: 7.269074295019226", instanceTrue.getCircleDiameter());
        assertEquals("Error while calculating the Diameter of the Circle", instanceFalse.getCircleDiameter());
    }
}
