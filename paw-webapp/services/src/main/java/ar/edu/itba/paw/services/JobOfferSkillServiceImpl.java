package ar.edu.itba.paw.services;

import ar.edu.itba.paw.interfaces.persistence.JobOfferSkillDao;
import ar.edu.itba.paw.interfaces.services.JobOfferSkillService;
import ar.edu.itba.paw.models.JobOffer;
import ar.edu.itba.paw.models.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Primary
@Service
public class JobOfferSkillServiceImpl implements JobOfferSkillService {

    private final JobOfferSkillDao jobOfferSkillDao;

    @Autowired
    public JobOfferSkillServiceImpl(JobOfferSkillDao jobOfferSkillDao){
        this.jobOfferSkillDao = jobOfferSkillDao;
    }

    @Override
    public boolean addSkillToJobOffer(String skillDescription, long jobOfferID) {
        return jobOfferSkillDao.addSkillToJobOffer(skillDescription, jobOfferID);
    }

    @Override
    public boolean addSkillToJobOffer(long skillID, long jobOfferID) {
        return jobOfferSkillDao.addSkillToJobOffer(skillID, jobOfferID);
    }

    @Override
    public List<JobOffer> getJobOffersWithSkill(String skillDescription) {
        return jobOfferSkillDao.getJobOffersWithSkill(skillDescription);
    }

    @Override
    public List<JobOffer> getJobOffersWithSkill(long skillID) {
        return jobOfferSkillDao.getJobOffersWithSkill(skillID);
    }

    @Override
    public List<Skill> getSkillsForJobOffer(long jobOfferID) {
        return jobOfferSkillDao.getSkillsForJobOffer(jobOfferID);
    }
}
