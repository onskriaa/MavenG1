package dao;

import model.Trajet;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class TrajetDAO {

    public void ajouterTrajet(Trajet t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(t);
            tx.commit();
        } finally {
            session.close();
        }
    }

    public void modifierTrajet(Trajet t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(t);
            tx.commit();
        } finally {
            session.close();
        }
    }

    public void supprimerTrajet(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Trajet t = session.get(Trajet.class, id);
            if (t != null) session.delete(t);
            tx.commit();
        } finally {
            session.close();
        }
    }

    public Trajet getTrajetById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.get(Trajet.class, id);
        } finally {
            session.close();
        }
    }

    public List<Trajet> getAllTrajets() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("FROM Trajet", Trajet.class).list();
        } finally {
            session.close();
        }
    }

    public List<Trajet> getTrajetsDepuis(String gareDepart) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Query<Trajet> query = session.createQuery(
                "FROM Trajet WHERE gareDepart = :gare", Trajet.class);
            query.setParameter("gare", gareDepart);
            return query.list();
        } finally {
            session.close();
        }
    }
}
