package category;

import java.io.File;
import java.util.List;

public interface categorydao {

void insert(Category c);
void delete(int id);
void update(Category c);

String findimage(String name, File file);
Category getCategory(int id);
Category getCategory(String cate_name);
List<Category> getCategory();
}
