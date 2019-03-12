package de.tum.in.dbpra.model.beans;

public class TimetableBean {

    private int id;
    private String startPlay;
    private String endPlay;
    private String stageName;
    private String bandName;

    public TimetableBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartPlay() {
        return startPlay;
    }

    public void setStartPlay(String startPlay) {
        this.startPlay = startPlay;
    }

    public String getEndPlay() {
        return endPlay;
    }

    public void setEndPlay(String endPlay) {
        this.endPlay = endPlay;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }
}
