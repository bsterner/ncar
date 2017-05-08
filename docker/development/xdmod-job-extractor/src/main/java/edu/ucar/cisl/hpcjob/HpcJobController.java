package edu.ucar.cisl.hpcjob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HpcJobController {

    private final HpcJobQuery hpcJobQuery;

    @Autowired
    public HpcJobController(HpcJobQuery hpcJobQuery) {
        this.hpcJobQuery = hpcJobQuery;
    }

    @RequestMapping("/hpcjob/{machine}/after/{afterJobId}")
    @ResponseBody
    public List<HpcJob> getJobsFromJobId(@PathVariable String machine, @PathVariable Integer afterJobId, @RequestParam Integer maxResults) {
        return hpcJobQuery.getJobs(machine, afterJobId, maxResults);
    }

}
