package de.tum.in.dbpra.model.dao;

import java.sql.*;
import java.util.ArrayList;

import de.tum.in.dbpra.base.model.dao.BaseDAO;
import de.tum.in.dbpra.model.beans.PersonBean;
import de.tum.in.dbpra.model.beans.TimetableBean;


public class TimetableDAO extends BaseDAO{

    // Query which retrieves the personal timetable of person. Fill the timeslots to personTimetable which is used by the servlets
    public void getPersonalTimetable(PersonBean person, ArrayList<TimetableBean> personalTimetable) throws SQLException, ClassNotFoundException{


        String query = "SELECT t.ID, t.START_PLAY, t.END_PLAY, s.NAME, eo.NAME as name2  " +
                "FROM PERSONAL_TIMETABLE pt, TIMETABLE t, STAGE s, EXTERNAL_ORGANISATION eo  " +
                "WHERE pt.VISITOR = ? and pt.TIMETABLE = t.ID and t.STAGE = s.ID and t.BAND_ASSIGNED_TO = eo.ID " +
                "ORDER BY t.START_PLAY;";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, person.getId());
            rs = pstmt.executeQuery();

            while (rs.next()) {

                TimetableBean tb = new TimetableBean();
                tb.setId(rs.getInt("id"));
                tb.setStartPlay(rs.getString("start_play"));
                tb.setEndPlay(rs.getString("end_play"));
                tb.setStageName (rs.getString("name"));
                tb.setBandName(rs.getString("name2"));
                personalTimetable.add(tb);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
        }
    }

    // Adds timetable to person's timetable.
    public void addEntry(PersonBean person, TimetableBean timetable) throws SQLException, ClassNotFoundException {

        String query = "INSERT INTO personal_timetable\n" +
                "VALUES (?, ?)";

        // Help method that perform the query and closes connections
        executeUpdateQueries(query, person, timetable);
    }

    // Checks if a new entry to personal timetable conflicts with another (start_play and end_play is in the same timeframe)
    // Finds multiple entries if present
    public ArrayList<String[]> check(PersonBean person, TimetableBean tBean) throws SQLException, ClassNotFoundException{
        String query = "WITH timeTableValues AS (\n" +
                "SELECT * FROM timetable\n" +
                "WHERE id = ?)\n" +
                "SELECT e.name, t.start_play, t.end_play, s.name AS stagename\n" +
                "FROM timeTableValues tv, timetable t, personal_timetable p, visitor v, external_organisation e, stage s\n" +
                "WHERE v.id = ? AND p.visitor = v.id AND p.timetable = t.id AND t.band_assigned_to = e.id AND s.id = t.stage\n" +
                "AND (tv.start_play BETWEEN t.start_play AND t.end_play\n" +
                "OR tv.end_play BETWEEN t.start_play AND t.end_play\n" +
                "OR t.start_play BETWEEN tv.start_play AND tv.end_play\n" +
                "OR t.end_play BETWEEN tv.start_play AND tv.end_play)\n" +
                "ORDER BY tv.start_play;";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String[]> list;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, tBean.getId());
            pstmt.setInt(2, person.getId());
            rs = pstmt.executeQuery();
            list = new ArrayList<>();

            while(rs.next()) {
                String[] tmp = new String[4];
                tmp[0] = rs.getString("name");
                tmp[1] = rs.getString("start_play");
                tmp[2] = rs.getString("end_play");
                tmp[3] = rs.getString("stagename");
                list.add(tmp);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
        }
        return list;
    }

    // query that removes entry 'timetable' from persons' timetable
    public void removeEntry(PersonBean person, TimetableBean timetable) throws SQLException, ClassNotFoundException {

        String query = "DELETE FROM personal_timetable\n" +
                "WHERE visitor = ?\n"+
                "AND timetable = ?";

        // Help method that perform the query and closes connections
        executeUpdateQueries(query, person, timetable);
    }

    // Gets the timetable for the entire festival.
    // Takes an arraylist which the method fills with each timeslot
    public void getFestivalTimetable(ArrayList<TimetableBean> timetableList) throws SQLException, ClassNotFoundException {


        String query = "SELECT t.id, t.start_play, t.end_play, s.name AS stage, eo.name AS band\n" +
                "FROM timetable t, stage s, external_organisation eo\n" +
                "WHERE t.stage = s.id\n" +
                "AND eo.id = t.band_assigned_to\n" +
                "ORDER BY t.start_play";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                TimetableBean tb = new TimetableBean();
                tb.setId(rs.getInt("id"));
                tb.setStartPlay(rs.getString("start_play"));
                tb.setEndPlay(rs.getString("end_play"));
                tb.setStageName (rs.getString("stage"));
                tb.setBandName(rs.getString("Band"));
                timetableList.add(tb);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
        }
    }

    // Support method to 'addEntry' and 'removeEntry'. Executes the query and closes con and pstmt.
    // Rollback in case of SQLException.
    private void executeUpdateQueries(String query, PersonBean person, TimetableBean timetable) throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, person.getId());
            pstmt.setInt(2, timetable.getId());

            pstmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, null);
        }
    }

    // Closes Connection, PreparedStatement and ResultSet
    private void closeConnectionAndStatementAndResultset (PreparedStatement pstmt, Connection con, ResultSet rs) throws SQLException{
        if(pstmt != null)
            pstmt.close();
        if(con != null)
            con.close();
        if(rs != null)
            rs.close();
    }
}