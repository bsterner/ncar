package edu.ucar.cisl.lastjob.query;

import edu.ucar.cisl.lastjob.LastJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component(value = "lastJobQuery")
public class LastJobQuery implements edu.ucar.cisl.lastjob.LastJobQuery {

    private static final String GET_LAST_JOB_QUERY =
            "SELECT MAX(sj.shredded_job_pbs_id) as jobSequenceNumber"
                    + ", ? AS machine"
                    + " FROM mod_shredder.shredded_job_pbs sj "
                    + " WHERE sj.host = ?";

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public LastJobQuery(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public LastJob getLastJob(String machine) {
        LastJob job = (LastJob) jdbcTemplate.queryForObject(GET_LAST_JOB_QUERY, new BeanPropertyRowMapper(LastJob.class), machine, machine);
        return job;
    }
}
