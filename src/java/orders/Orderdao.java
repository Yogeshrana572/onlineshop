package orders;

import java.util.List;

public interface Orderdao {
    void insert(Order o);
    void delete(int id);
    void update(Order o);
    List<Order> getOrder();
    Order getOrder(int id);
    Order getOrders(int id);
    
}
