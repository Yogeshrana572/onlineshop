package buy;

import java.util.List;

public interface paymentdao {
    void insert(Payment p);
    Payment getPayment(int id);
    List<Payment> getPayment();
    Payment getPayments(String card);
}
