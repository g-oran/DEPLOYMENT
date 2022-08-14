public class GetterSetterExample {
    public String fname {set; get;}
    public String lname {set; get;}
    public String fullname {set; get;}
    public GetterSetterExample(){
        fname = 'Gokmen';
        lname = 'Clarusway';
    }
    public PageReference concat(){
        fullname = fname + ' ' + lname;
        return null;
    }
}