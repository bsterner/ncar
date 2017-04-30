package edu.ucar.cisl.hpcjob;

public class HpcJob {


    private Integer jobSequenceNumber;
    private String username;
    private String projcode;
    private String queueJobId;
    private Integer jobArrayIndex;
    private String jobName;
    private String queueName;
    private Integer startTime;
    private Integer endTime;
    private Integer submitTime;
    private Integer cpuTime;
    private Integer queueWaitTime;
    private Integer numberOfNodes;
    private Integer numberOfProcessors;
    private String machine;


    public Integer getJobSequenceNumber() {
        return jobSequenceNumber;
    }

    public void setJobSequenceNumber(Integer jobSequenceNumber) {
        this.jobSequenceNumber = jobSequenceNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProjcode() {
        return projcode;
    }

    public void setProjcode(String projcode) {
        this.projcode = projcode;
    }

    public String getQueueJobId() {
        return queueJobId;
    }

    public void setQueueJobId(String queueJobId) {
        this.queueJobId = queueJobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getMachine() {
        return machine;
    }

    public void setMachine(String machine) {
        this.machine = machine;
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public Integer getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Integer submitTime) {
        this.submitTime = submitTime;
    }

    public Integer getCpuTime() {return cpuTime;}

    public void setCpuTime(Integer cpuTime) {this.cpuTime = cpuTime;}

    public Integer getQueueWaitTime() {
        return queueWaitTime;
    }

    public void setQueueWaitTime(Integer queueWaitTime) {
        this.queueWaitTime = queueWaitTime;
    }

    public Integer getNumberOfNodes() {
        return numberOfNodes;
    }

    public void setNumberOfNodes(Integer numberOfNodes) {
        this.numberOfNodes = numberOfNodes;
    }

    public Integer getNumberOfProcessors() {
        return numberOfProcessors;
    }

    public void setNumberOfProcessors(Integer numberOfProcessors) {
        this.numberOfProcessors = numberOfProcessors;
    }

    public Integer getJobArrayIndex() {
        return jobArrayIndex;
    }

    public void setJobArrayIndex(Integer jobArrayIndex) {
        this.jobArrayIndex = jobArrayIndex;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        HpcJob job = (HpcJob) o;

        return jobSequenceNumber.equals(job.jobSequenceNumber);

    }

    @Override
    public int hashCode() {
        return jobSequenceNumber.hashCode();
    }

    @Override
    public String toString() {
        return "HpcJob{" +
                "jobSequenceNumber=" + jobSequenceNumber +
                ", username='" + username + '\'' +
                ", projcode='" + projcode + '\'' +
                ", queueJobId='" + queueJobId + '\'' +
                ", jobArrayIndex=" + jobArrayIndex +
                ", jobName='" + jobName + '\'' +
                ", queueName='" + queueName + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", submitTime=" + submitTime +
                ", cpuTime=" + cpuTime +
                ", queueWaitTime=" + queueWaitTime +
                ", numberOfNodes=" + numberOfNodes +
                ", numberOfProcessors=" + numberOfProcessors +
                ", machine='" + machine + '\'' +
                '}';
    }
}
