package com.spr.controller;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import static java.lang.System.out;

/**
 * Created by Catalina on 02.06.2017.
 */
public class SendGmail {
    protected static void sendEmail(String customerGmail, String title, String subject) {
        String username = "appjavatest100@gmail.com";
        String password = "test100app";

        try {
            String host = "smtp.gmail.com";

            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", username);
            props.put("mail.smtp.password", password);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.debug", "true");

            Session session = Session.getInstance(props, new GMailAuthenticator(username, password));
            MimeMessage message = new MimeMessage(session);
            Address fromAddress = new InternetAddress(username);
            Address toAddress = new InternetAddress(customerGmail);

            message.setFrom(fromAddress);
            message.setRecipient(Message.RecipientType.TO, toAddress);

            message.setSubject(title);
            message.setText(subject);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, username, password);
            message.saveChanges();
            Transport.send(message);
            transport.close();

        } catch (Exception ex) {

            out.println("<html><head></head><body>");
            out.println("ERROR: " + ex);
            out.println("</body></html>");
        }
    }
}
