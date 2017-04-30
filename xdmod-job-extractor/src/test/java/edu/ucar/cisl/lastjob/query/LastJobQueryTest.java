package edu.ucar.cisl.lastjob.query;

import edu.ucar.cisl.lastjob.LastJob;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.when;

public class LastJobQueryTest {

    @Mock
    private JdbcTemplate jdbcTemplate;

    @InjectMocks
    private LastJobQuery query;

    private LastJob job;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);

        job = new LastJob();

        when(jdbcTemplate.queryForObject(anyString(), any(BeanPropertyRowMapper.class), anyString(), anyString())).thenReturn(job);
    }

    @Test
    public void given_jobs__when_getJobs_then_jobs_returned() {
        assertThat(query.getLastJob("machineName"), is(job));
    }

}