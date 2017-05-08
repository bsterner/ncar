package edu.ucar.cisl.hpcjob.query;

import edu.ucar.cisl.hpcjob.HpcJob;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class HpcJobQueryTest {

    private static final String MACHINE = "machine";

    @Mock
    private ReservationQueueTransformer reservationQueueTransformer;

    @Mock
    private JdbcTemplate jdbcTemplate;

    @InjectMocks
    private HpcJobQuery query;

    private List<HpcJob> jobs;

    @Before
    public void setUp() {
        createJobs(10);
        when(jdbcTemplate.query(anyString(), any(Object[].class), any(BeanPropertyRowMapper.class))).thenReturn(jobs);
    }

    @Test
    public void given_jobs__when_getJobs__then_jobs_returned() {
        assertThat(query.getJobs(MACHINE, 10, 500), is(jobs));
    }

    @Test
    public void given_jobs__when_getJobs__then_job_transformed_by_reservation_transformer() throws Exception {
        for (HpcJob job : query.getJobs(MACHINE, 10, 500)) {
            verify(reservationQueueTransformer).transform(job);
        }
    }

    private void createJobs(Integer count) {
        jobs = new ArrayList<HpcJob>();
        for (int i = 1; i <= count; i++) {
            HpcJob job = new HpcJob();
            job.setJobSequenceNumber(i);
            jobs.add(job);
        }
    }

}