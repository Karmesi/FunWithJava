package com.school.jtestjava;

import java.util.Scanner;
import com.school.jtestjava.GeometricFiguresClass;
import com.school.jtestjava.MathClass;
import com.school.jtestjava.StringsClass;

public class testApp {
    public static void main(String[] args) {
        try {
            testApp app = new testApp();
            app.run();
        } catch (Exception e) {
            System.out.println("Main error!");
        }
    }
    
    private void run(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the number of the class that you want to run:"
                + "\n1) GeometricFiguresClass"
                + "\n2) MathClass"
                + "\n3) StringsClass");
        int script = scanner.nextInt();
        
        switch(script) {
            case 1:
                System.out.println("You have selected GeometricFiguresClass");
                System.out.println("Please, Enter the  length of one of the square sides");
                double square = scanner.nextDouble();
                System.out.println("Please, Enter the area of the circle");
                double circle = scanner.nextDouble();
                GeometricFiguresClass gfc = new GeometricFiguresClass(square, circle);
                System.out.println(gfc.getCircleDiameter());
                System.out.println(gfc.getSquareArea());
                break;
            case 2:
                System.out.println("You have selected MathClass");
                System.out.println("Please, Enter a integer number");
                int number = scanner.nextInt();
                MathClass mc = new MathClass(number);
                System.out.println(mc.isPrimeNumber());
                break;
            case 3:
                System.out.println("You have selected StringsClass");
                System.out.println("Please, Enter the  length of one of the square sides");
                String text = scanner.next();
                StringsClass sc = new StringsClass(text);
                System.out.println(sc.getMayusOnText());
                System.out.println(sc.getNumbersOnText());
                break;
            default:
                System.out.println("Script not found");
        }
    }
}
