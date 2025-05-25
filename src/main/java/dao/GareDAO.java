package dao;

import model.Gare;
import org.hibernate.*;
import util.HibernateUtil;

import java.util.List;

public class GareDAO {

    public void ajouterGare(Gare g) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(g);
        tx.commit();
        session.close();
    }

    public void modifierGare(Gare g) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(g);
        tx.commit();
        session.close();
    }

    public void supprimerGare(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Gare g = session.get(Gare.class, id);
        if (g != null) session.delete(g);
        tx.commit();
        session.close();
    }

    public Gare getGareById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Gare g = session.get(Gare.class, id);
        session.close();
        return g;
    }

    public List<Gare> getAllGares() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Gare> liste = session.createQuery("from Gare", Gare.class).list();
        session.close();
        return liste;
    }
}
