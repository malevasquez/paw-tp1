package ar.edu.itba.paw.interfaces.persistence;


import ar.edu.itba.paw.models.Enterprise;

import java.util.Optional;

public interface EnterpriseDao {
    Enterprise create(String email, String name, String password,  String location, String categoryName, String description);

    Optional<Enterprise> findByEmail(String email);

    Optional<Enterprise> findById(long enterpriseId);

    void changePassword(String email, String password);

    boolean enterpriseExists(String email);

    /* TODO:
        - findByLocation
        - findByCategory
        - findByCurrentPosition
        - findByDescription
     */
}
