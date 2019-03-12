package de.tum.in.dbpra.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import de.tum.in.dbpra.base.model.dao.BaseDAO;
import de.tum.in.dbpra.model.beans.PersonBean;

public class PersonDAO extends BaseDAO {
    public void login(PersonBean person, String email, String pw) throws FalsePasswordException, SQLException, ClassNotFoundException {

        // password verification by postgresql module pgcrypto, salt stored in password
        String query = "SELECT * FROM person WHERE e_mail = ? and password=crypt(?, (SELECT password FROM person WHERE e_mail = ?));";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pw);
            pstmt.setString(3, email);

            rs = pstmt.executeQuery();

            // if password does not match throw an exception
            if (!rs.next()) {
                person.setLogin_status(false);
                con.rollback();
                throw new FalsePasswordException(" Your inputs are wrong");
            // if password match set the person bean values
            } else {
                person.setId(rs.getInt("id"));
                person.setLastname(rs.getString("lastname"));
                person.setFirstname(rs.getString("firstname"));
                person.setEmail(rs.getString("e_mail"));
                person.setSubscribed_newsletter(rs.getBoolean("subscribes_newsletter"));
                person.setRfid(rs.getDouble("rfid"));
                person.setBalance(rs.getDouble("balance"));
                person.setStreet(rs.getString("street"));
                person.setStreetnumber(rs.getString("streetnumber"));
                person.setZipcode(rs.getString("zip_code"));
                person.setCity(rs.getString("city"));
                person.setCountry(rs.getString("country"));
                person.setEmergency_info(rs.getString("emergency_info"));
                person.setLogin_status(true);
                person.setPassword_length(pw.length()); // needed to display the amount of '*' on the personal information page
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
        }
    }

    // Change emergency info of the user
    public void changeEmergencyInfo (PersonBean person, String emergencyinfo) throws SQLException, ClassNotFoundException {
        String query = "UPDATE person SET emergency_info = ? where e_mail = ?;";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, emergencyinfo);
            pstmt.setString(2, person.getEmail());

            pstmt.executeUpdate();

            // update current user bean
            person.setEmergency_info(emergencyinfo);

        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, null);
        }
    }

    // Change mail of the user
    public void changeMail(PersonBean person, String email) throws SQLException, ClassNotFoundException {
        String query = "UPDATE person SET e_mail = ? where e_mail = ?;";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, person.getEmail());

            pstmt.executeUpdate();

            // update current user bean
            person.setEmail(email);
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, null);
        }
    }

    // Change newsletter preference of the user
    public void changeNewsletterPreference (PersonBean person, Boolean preference) throws SQLException, ClassNotFoundException {
        String query = "UPDATE person SET subscribes_newsletter = ? where e_mail = ?;";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setBoolean(1, preference);
            pstmt.setString(2, person.getEmail());

            pstmt.executeUpdate();

           // update current user bean
            person.setSubscribed_newsletter(preference);
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, null);
        }
    }

    // Method used to check if the entered password matches the one in the database. Returns 'false' if not.
    public boolean checkEnteredPassword(PersonBean person, String pw) throws FalsePasswordException, SQLException, ClassNotFoundException {

        // password verification by postgresql module pgcrypto, salt stored in password
        String query = "SELECT * FROM person WHERE e_mail = ? AND password = crypt(?, (SELECT password FROM person WHERE e_mail = ?))";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, person.getEmail());
            pstmt.setString(2, pw);
            pstmt.setString(3, person.getEmail());

            rs = pstmt.executeQuery();

            return rs.next();

        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
        }
    }

    // Change password of the user
    public void resetPassword(PersonBean person, String pw) throws SQLException, ClassNotFoundException {
        String query = "UPDATE person SET password = crypt(?, gen_salt('md5')) WHERE e_mail = ?;";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
        con = getConnection();
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, pw);
        pstmt.setString(2, person.getEmail());

        pstmt.executeUpdate();

        // update current user bean
        person.setPassword_length(pw.length());

        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, null);
        }
    }

    // Add new visitor to the database
    public void register(PersonBean person) throws PersonDAO.UserExistException, PersonDAO.RegistrationFailedException, SQLException, ClassNotFoundException {

        // query to see if there is already a user with this email
        String query = "Select * from person where e_mail= ?";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;


        try {
            con = getConnection();
            con.setAutoCommit(false);
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, person.getEmail());
            rs = pstmt.executeQuery();

            // if there is a user with the email entered notify the user
            if(rs.next()){
                con.rollback();
                throw new PersonDAO.UserExistException("There is already a user with this email address");
            }

            // get the latest vaalue of the person table
            String queryMaxID="select max(id) from person;";
            pstmt = con.prepareStatement(queryMaxID);
            rs = pstmt.executeQuery();
            Integer maxID=0;
            if(rs.next()){
                maxID = rs.getInt("max");
            }
            // increase the value by 1 for insert statement
            maxID +=1;

            //insert statement for the new user
            String queryInsert =
                    "INSERT INTO PERSON (ID, lastname, firstname, e_mail, password, SUBSCRIBES_NEWSLETTER, balance, street, streetnumber, zip_code, city, country, emergency_info  ) VALUES" +
                            "(?,?,?,?,crypt(?,gen_salt('md5')),?,0.00,?,?,?,?,?,? );";

            pstmt = con.prepareStatement(queryInsert);

            pstmt.setInt(1,maxID);
            pstmt.setString(2, person.getLastname());
            pstmt.setString(3, person.getFirstname());
            pstmt.setString(4, person.getEmail());
            pstmt.setString(5, person.getPassword());
            pstmt.setBoolean(6, person.isSubscribed_newsletter());
            pstmt.setString(7, person.getStreet());
            pstmt.setString(8,person.getStreetnumber() );
            pstmt.setString(9, person.getZipcode());
            pstmt.setString(10, person.getCity());
            pstmt.setString(11, person.getCountry());
            pstmt.setString(12,"");

            Integer i = pstmt.executeUpdate();

            //Query to insert into visitors (as everyone who registers right now is a visitor)
            String queryInsert2 =
                    "INSERT INTO Visitor (ID) VALUES (?);";
            pstmt = con.prepareStatement(queryInsert2);
            pstmt.setInt(1,maxID);
            Integer ii = pstmt.executeUpdate();
            con.commit();

            //check if both inserts are correct
            if (i == 1 && ii==1) {
                //registration successful
            } else {
                con.rollback();
                throw new PersonDAO.RegistrationFailedException("The registration failed -");
            }
        } catch (ClassNotFoundException | SQLException e) {
            if(con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            closeConnectionAndStatementAndResultset(pstmt, con, rs);
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

    public static class FalsePasswordException extends Throwable {
        /**
         *
         */
        private static final long serialVersionUID = 1L;

        FalsePasswordException(String message) {
            super(message);
        }
    }

    public static class UserExistException extends Throwable {
        /**
         *
         */
        private static final long serialVersionUID = 1L;

        UserExistException(String message) {
            super(message);
        }
    }

    public static class RegistrationFailedException extends Throwable {
        /**
         *
         */
        private static final long serialVersionUID = 1L;

        RegistrationFailedException(String message) {
            super(message);
        }
    }
}