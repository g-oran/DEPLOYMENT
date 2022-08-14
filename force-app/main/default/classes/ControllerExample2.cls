public class ControllerExample2 {
    public ControllerExample2(ApexPages.StandardController controller) {
    }
    public Date curdate;
    public Date getDate(){
        curdate = Date.Today();
        return curdate;
    }
}