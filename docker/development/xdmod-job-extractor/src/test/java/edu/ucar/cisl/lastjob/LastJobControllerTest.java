package edu.ucar.cisl.lastjob;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.hamcrest.Matchers.equalTo;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = MockServletContext.class)
@WebAppConfiguration
public class LastJobControllerTest {

    private MockMvc mvc;

    @Mock
    private LastJobQuery lastJobQuery;

    @InjectMocks
    private LastJobController lastJobController;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);

        mvc = MockMvcBuilders.standaloneSetup(lastJobController).build();
    }

    @Test
    public void given_last_job_id__when_getLastJob__then_return_job_id() throws Exception {
        LastJob job = new LastJob();

        job.setJobSequenceNumber(1001);
        job.setMachine("cheyenne");

        when(lastJobQuery.getLastJob("cheyenne")).thenReturn(job);

        mvc.perform(MockMvcRequestBuilders.get("/lastjob/cheyenne").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("{\"jobSequenceNumber\":1001,\"machine\":\"cheyenne\"}")));

        verify(lastJobQuery).getLastJob("cheyenne");
    }

    @Test
    public void given_no_job_data__when_getLastJob__then_return_null() throws Exception {
        LastJob job = new LastJob();

        when(lastJobQuery.getLastJob("cheyenne")).thenReturn(job);

        mvc.perform(MockMvcRequestBuilders.get("/lastjob/cheyenne").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("{\"jobSequenceNumber\":null,\"machine\":null}")));

        verify(lastJobQuery).getLastJob("cheyenne");
    }

}