package de.tum.in.dbpra.model.beans;

public class PersonBean {
    private int id;
    private String lastname;
    private String firstname;
    private String email;
    private String password; //for registration
    private boolean subscribed_newsletter;
    private double rfid;
    private double balance;
    private String street;
    private String streetnumber;
    private String zipcode;
    private String city;
    private String country;
    private String emergency_info;
    private boolean login_status;
    private int password_length; // needed to display the amount of '*' on the personal information page

    public int getPassword_length() { return password_length; }

    public void setPassword_length(int password_length) {
        this.password_length = password_length;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSubscribed_newsletter() {
        return subscribed_newsletter;
    }

    public void setSubscribed_newsletter(boolean subscribed_newsletter) {
        this.subscribed_newsletter = subscribed_newsletter;
    }

    public double getRfid() {
        return rfid;
    }

    public void setRfid(double rfid) {
        this.rfid = rfid;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreetnumber() {
        return streetnumber;
    }

    public void setStreetnumber(String streetnumber) {
        this.streetnumber = streetnumber;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getEmergency_info() {
        return emergency_info;
    }

    public void setEmergency_info(String emergency_info) {
        this.emergency_info = emergency_info;
    }

    public boolean isLogin_status() {
        return login_status;
    }

    public void setLogin_status(boolean login_status) {
        this.login_status = login_status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}