package de.tum.in.dbpra.controller;

import de.tum.in.dbpra.model.beans.PersonBean;
import de.tum.in.dbpra.model.dao.PersonDAO;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;

@javax.servlet.annotation.WebServlet(name = "login")
public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            // if password do not match, do not procceed
            if (!(request.getParameter("password")).equals(request.getParameter("password_control"))) {
                request.setAttribute("error", "Passwords do not match");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
                dispatcher.forward(request, response);
            } else {

                PersonBean user = new PersonBean();
                user.setEmail((request.getParameter("email")));
                user.setCity((request.getParameter("city")));
                user.setCountry(request.getParameter("country"));
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setStreet(request.getParameter("street"));
                user.setStreetnumber(request.getParameter("streetNumber"));
                if (request.getParameter("subscribe_newsletter") != null && request.getParameter("subscribe_newsletter").equals("on")) {
                    user.setSubscribed_newsletter(true);
                } else {
                    user.setSubscribed_newsletter(false);
                }
                user.setZipcode(request.getParameter("zipcode"));
                user.setPassword(request.getParameter("password"));
                PersonDAO personDAO = new PersonDAO();
                // create a user in the person (and currently) visitor table
                personDAO.register(user);

                //register process should be successful
                RequestDispatcher dispatcher = request.getRequestDispatcher("login");
                dispatcher.forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            // e.printStackTrace();
            request.setAttribute("error", e.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
            dispatcher.forward(request, response);

        } catch (PersonDAO.UserExistException e) {
            request.setAttribute("error", "There is already a user with this email address");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
            dispatcher.forward(request, response);

        } catch (PersonDAO.RegistrationFailedException e) {
            request.setAttribute("error", e.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
            dispatcher.forward(request, response);

        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
        dispatcher.forward(request, response);
    }
}
