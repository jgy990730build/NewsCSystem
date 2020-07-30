package com.sise.jgy.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static SessionFactory sf;
    private HibernateUtil() {}
    static
    {
        Configuration cfg=new Configuration().configure();
        sf=cfg.buildSessionFactory();
    }
    public static Session getSession() {
        Session session=sf.getCurrentSession();
        return session;
    }
}
