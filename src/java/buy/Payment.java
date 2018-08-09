package buy;
public class Payment {
    private int id;
    private String bank;
    private String cadr_no;
    private String expiry_date;
    private String cvv;
    private String holder;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getCadr_no() {
        return cadr_no;
    }

    public void setCadr_no(String cadr_no) {
        this.cadr_no = cadr_no;
    }

    public String getExpiry_date() {
        return expiry_date;
    }

    public void setExpiry_date(String expiry_date) {
        this.expiry_date = expiry_date;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getHolder() {
        return holder;
    }

    public void setHolder(String holder) {
        this.holder = holder;
    }
    
    public Payment(){
        
    }
}
