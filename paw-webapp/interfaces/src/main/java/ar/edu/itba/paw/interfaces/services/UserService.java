package ar.edu.itba.paw.interfaces.services;

import ar.edu.itba.paw.models.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    User register(String email, String password, String name, String location, String categoryName, String currentPosition, String description, String education);

    Optional<User> findByEmail(String email);

    Optional<User> findById(long userId);

    boolean userExists(String email);

    List<User> getAllUsers();

    void changePassword(String email, String password);

    Optional<Integer> getUsersCount();

    List<User> getUsersList(int page, int pageSize);

    List<User> getUsersListByCategory(int page, int pageSize, int categoryId);

}
