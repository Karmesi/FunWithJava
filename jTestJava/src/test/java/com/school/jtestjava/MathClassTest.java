package com.school.jtestjava;

import junit.framework.*;

public class MathClassTest extends TestCase{
    public void testIsPrimeNumber() {
        System.out.println("isPrimeNumber");
        MathClass instanceTrue = new MathClass(9);
        MathClass instanceFalse = new MathClass(20);
        assertEquals("9 is not prime" , instanceTrue.isPrimeNumber());
        assertEquals("20 is not prime" , instanceFalse.isPrimeNumber());
    }
}
