package dao;

import model.Voyage;
import org.hibernate.*;
import util.HibernateUtil;
import java.util.List;

public class VoyageDAO {

    public void ajouterVoyage(Voyage v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(v);
        tx.commit();
        session.close();
    }

    public void modifierVoyage(Voyage v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(v);
        tx.commit();
        session.close();
    }

    public void supprimerVoyage(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Voyage v = session.get(Voyage.class, id);
        if (v != null) session.delete(v);
        tx.commit();
        session.close();
    }

    public Voyage getVoyageById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Voyage v = session.get(Voyage.class, id);
        session.close();
        return v;
    }

    public List<Voyage> getAllVoyages() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Voyage> liste = session.createQuery("from Voyage", Voyage.class).list();
        session.close();
        return liste;
    }
}