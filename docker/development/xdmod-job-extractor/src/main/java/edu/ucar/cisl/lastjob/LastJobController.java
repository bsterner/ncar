package edu.ucar.cisl.lastjob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LastJobController {

    private final LastJobQuery lastJobQuery;

    @Autowired
    public LastJobController(LastJobQuery lastJobQuery) {
        this.lastJobQuery = lastJobQuery;
    }

    @RequestMapping("/lastjob/{machine}")
    @ResponseBody
    public LastJob last(@PathVariable String machine) {
        return lastJobQuery.getLastJob(machine);
    }
}
