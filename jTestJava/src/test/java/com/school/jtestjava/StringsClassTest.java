package com.school.jtestjava;

import junit.framework.*;

public class StringsClassTest extends TestCase {

    private final String text = "Th15 1s jusT 4 t3st l1ne";

    public void testGetNumbersOnText() {
        System.out.println("getNumbersOnText");
        StringsClass instanceTrue = new StringsClass(this.text);
        StringsClass instanceFalse = new StringsClass("");
        assertEquals("The text has 6 numbers (151431)", instanceTrue.getNumbersOnText());
        assertEquals("The text has 0 numbers ()", instanceFalse.getNumbersOnText());
    }

    public void testGetMayusOnText() {
        System.out.println("getMayusOnText");
        StringsClass instanceTrue = new StringsClass(this.text);
        StringsClass instanceFalse = new StringsClass("");
        assertEquals("The text has 2 upper case letters (TT)", instanceTrue.getMayusOnText());
        assertEquals("The text has 0 upper case letters ()", instanceFalse.getMayusOnText());
    }

}
