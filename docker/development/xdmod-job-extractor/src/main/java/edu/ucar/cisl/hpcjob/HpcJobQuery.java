package edu.ucar.cisl.hpcjob;

import java.util.List;

public interface HpcJobQuery {

    List<HpcJob> getJobs(String machine, Integer afterJobId, Integer maxResults);
}
