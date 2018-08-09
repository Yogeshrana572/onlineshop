package product;

import java.io.File;
import java.util.List;

public interface productdao {
void insert(Product p);
void delete(int id);
void update(Product p);



String findimage(String name, File file);
Product getProduct(int id);
    List<Product> getProduct();
    List<Product> getProduct(String Cat);
    
    
}
