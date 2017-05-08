package edu.ucar.cisl.hpcjob.query;

import edu.ucar.cisl.hpcjob.HpcJob;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

public class ReservationQueueTransformerTest {

    private ReservationQueueTransformer transformer;
    private HpcJob job;

    @Before
    public void setUp() throws Exception {
        transformer = new ReservationQueueTransformer();
        job = new HpcJob();
    }

    @Test
    public void given_queue_name_RNUMBER__when_transform__then_return_job_with_queue_name_reservation() {
        job.setQueueName("R1");
        assertHasReservationQueue(transformer.transform(job));
    }

    @Test
    public void given_queue_name_RNUMBERS__when_transform__then_return_job_with_queue_name_reservation() {
        job.setQueueName("R01234567");
        assertHasReservationQueue(transformer.transform(job));
    }

    @Test
    public void given_queue_name_SNUMBER__when_transform__then_return_job_with_queue_name_reservation() {
        job.setQueueName("S1");
        assertHasReservationQueue(transformer.transform(job));
    }

    @Test
    public void given_queue_name_SNUMBERS__when_transform__then_return_job_with_queue_name_reservation() {
        job.setQueueName("S01234567");
        assertHasReservationQueue(transformer.transform(job));
    }

    @Test
    public void given_queue_name_others__when_transform__then_return_job_with_original_queue_name() {
        List<String> others = new ArrayList<String>();

        others.add("ampsrt");
        others.add("capability");
        others.add("regular");
        others.add("economy");
        others.add("hpss");
        others.add("premium");
        others.add("regular");
        others.add("reservation");
        others.add("small");

        for(String other : others) {
            job.setQueueName(other);
            transformer.transform(job);
            assertThat(job.getQueueName(), is(other));
        }
    }

    private void assertHasReservationQueue(HpcJob transformedJob) {
        assertThat(transformedJob.getQueueName(), is(ReservationQueueTransformer.RESERVATION_QUEUE_NAME));
    }
}