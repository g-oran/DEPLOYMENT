public class ControllerExample {
    public Account acc;
    public ControllerExample(ApexPages.StandardController controller) {
        acc = (Account)controller.getRecord();
    }
    public String greeting;
    public String getgreeting(){
        greeting = 'Hello ' + acc.Name;
        return greeting;
    }
}