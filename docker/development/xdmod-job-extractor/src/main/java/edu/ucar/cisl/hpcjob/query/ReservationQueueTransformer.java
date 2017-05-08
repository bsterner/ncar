package edu.ucar.cisl.hpcjob.query;

import edu.ucar.cisl.hpcjob.HpcJob;
import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class ReservationQueueTransformer {

    public static final String RESERVATION_QUEUE_NAME = "reservation";

    private static final Pattern RESERVATION_PATTERN = Pattern.compile("^(R|S)\\d+");

    public HpcJob transform(HpcJob job) {

        Matcher matcher = RESERVATION_PATTERN.matcher(job.getQueueName());
        if(matcher.find()) {
            job.setQueueName(RESERVATION_QUEUE_NAME);
        }

        return job;
    }

}
