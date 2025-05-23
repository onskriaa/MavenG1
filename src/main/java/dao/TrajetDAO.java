package dao;

import model.Trajet;
import org.hibernate.*;
import util.HibernateUtil;
import java.util.List;

public class TrajetDAO {
    public void ajouterTrajet(Trajet t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(t);
        tx.commit();
        session.close();
    }

    public void modifierTrajet(Trajet t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(t);
        tx.commit();
        session.close();
    }

    public void supprimerTrajet(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Trajet t = session.get(Trajet.class, id);
        if (t != null) session.delete(t);
        tx.commit();
        session.close();
    }

    public Trajet getTrajetById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Trajet t = session.get(Trajet.class, id);
        session.close();
        return t;
    }

    public List<Trajet> getAllTrajets() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Trajet> liste = session.createQuery("from Trajet", Trajet.class).list();
        session.close();
        return liste;
    }
}
