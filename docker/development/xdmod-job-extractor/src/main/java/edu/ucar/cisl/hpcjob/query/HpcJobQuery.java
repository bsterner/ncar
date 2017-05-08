package edu.ucar.cisl.hpcjob.query;

import edu.ucar.cisl.hpcjob.HpcJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class HpcJobQuery implements edu.ucar.cisl.hpcjob.HpcJobQuery {

    private static final String GET_JOBS_QUERY =
            "SELECT sj.shredded_job_pbs_id as jobSequenceNumber," +
                    "       sj.user AS username," +
                    "       REPLACE(sj.account,'\"','') AS projcode," +
                    "       sj.job_id AS queueJobId," +
                    "       sj.job_array_index as jobArrayIndex," +
                    "       sj.jobname AS jobName," +
                    "       sj.queue AS queueName," +
                    "       sj.start AS startTime," +
                    "       sj.end AS endTime," +
                    "       sj.ctime AS submitTime," +
                    "       sj.resources_used_cput AS cpuTime," +
                    "       GREATEST(sj.start - sj.ctime,0) AS queueWaitTime," +
                    "       sj.resources_used_nodes AS numberOfNodes," +
                    "       sj.resources_used_cpus AS numberOfProcessors," +
                    "       sj.host AS machine " +
                    "FROM mod_shredder.shredded_job_pbs sj " +
                    "WHERE sj.host = ? " +
                    "      AND sj.shredded_job_pbs_id > ? " +
                    "ORDER BY sj.shredded_job_pbs_id ASC LIMIT ?";

    private final JdbcTemplate jdbcTemplate;
    private final ReservationQueueTransformer reservationQueueTransformer;

    @Autowired
    public HpcJobQuery(JdbcTemplate jdbcTemplate, ReservationQueueTransformer reservationQueueTransformer) {
        this.jdbcTemplate = jdbcTemplate;
        this.reservationQueueTransformer = reservationQueueTransformer;
    }

    @Override
    public List<HpcJob> getJobs(String machine, Integer afterJobId, Integer maxResults) {
        return transform(jdbcTemplate.query(
                GET_JOBS_QUERY,
                new Object[]{
                        machine,
                        afterJobId,
                        maxResults
                }, new BeanPropertyRowMapper(HpcJob.class)));
    }

    private List<HpcJob> transform(List<HpcJob> jobs) {
        for(HpcJob job : jobs) {
            reservationQueueTransformer.transform(job);
        }

        return jobs;
    }
}
