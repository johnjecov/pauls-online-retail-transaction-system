package ports.utility;

import ports.controllers.*;
import java.sql.*;
import javax.servlet.*;
import ports.models.PortsDatabase;

public class portsInitializer implements ServletContextListener
{
    static Connection conn;
    @Override
    public void contextInitialized(ServletContextEvent event) 
    {
        System.out.println("Nasa listener na ang Paul's Pizzeria");
        ServletContext sc = event.getServletContext();
        try 
        {	
            Class.forName(sc.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            //creates the url for database
            String dbusername = sc.getInitParameter("dbUserName");
            String dbpassword = sc.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(sc.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(sc.getInitParameter("dbHostName"))
                    .append(":")
                    .append(sc.getInitParameter("dbPort"))
                    .append("/")
                    .append(sc.getInitParameter("databaseName"));
            conn =  DriverManager.getConnection(url.toString(),dbusername, dbpassword);
            
            //passes the model on the ports object so connection is not always created.
            PortsDatabase ports = new PortsDatabase(conn);
            sc.setAttribute("dbConnection", ports);
        } 
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe)
        {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
              
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) 
    {
        //nothing
    }
    
}

