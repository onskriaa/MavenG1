package dao;

import model.Arret;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ArretDAO {
    public void ajouterArret(Arret arret) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(arret);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
