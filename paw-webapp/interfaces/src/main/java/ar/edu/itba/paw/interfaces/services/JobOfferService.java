package ar.edu.itba.paw.interfaces.services;

import ar.edu.itba.paw.models.JobOffer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface JobOfferService {

    JobOffer create(long enterpriseID, long categoryID, String position, String description, BigDecimal salary);

    Optional<JobOffer> findById(long id);

    List<JobOffer> findByEnterpriseId(long enterpriseID);
}
