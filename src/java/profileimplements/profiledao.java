package profileimplements;

import java.util.List;

public interface profiledao {
    void insert(profile p);
    void delete(int id);
    void update(profile p);
    
    profile getProfile(int id);
    profile displayE(String email_id);
    List<profile> getProfile();
}
