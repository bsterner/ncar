package edu.ucar.cisl.hpcjob;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.mockito.Mockito.verify;

public class HpcJobControllerTest {

    private static final String MACHINE = "machine";
    @Mock
    private HpcJobQuery hpcJobQuery;

    @InjectMocks
    private HpcJobController hpcJobController;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getJob() throws Exception {
        hpcJobController.getJobsFromJobId(MACHINE, 10, 500);
        verify(hpcJobQuery).getJobs(MACHINE, 10, 500);
    }
}