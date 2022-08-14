@isTest
public class BodyMass_Test {
    @isTest
    public static void calculateBMI_Test1(){
        Decimal result = BodyMass.calculateBMI(111, 1.75);
        System.assertEquals((111/(1.75*1.75)), result);
    }
        
    @isTest
    public static void calculateBMI_Test2(){
        Decimal result = BodyMass.calculateBMI(-111, 1.75);
        System.assertEquals((-111/(1.75*1.75)), result);
    }
        
    @isTest
    public static void calculateBMI_Test3(){
        Decimal result = BodyMass.calculateBMI(0, 1.75);
        System.assertEquals((0/(1.75*1.75)), result);
        
    }
     @isTest
    public static void calculateBMI_Test4(){
        String result = BodyMass.calculateBMI('Gokmen', 'Oran');
        System.assertEquals('GOKMEN ORAN', result, 'Full name is not correct.');
        
    }

}