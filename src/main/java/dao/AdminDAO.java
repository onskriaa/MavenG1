package dao;

import model.Admin;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

import jakarta.persistence.NoResultException;

public class AdminDAO {

    // ✅ Vérifie si un admin existe avec email + mot de passe
    public Admin getAdminByEmailAndPassword(String email, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Admin admin = null;

        try {
            Query<Admin> query = session.createQuery(
                "from Admin where email = :email and password = :password", Admin.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            admin = query.getSingleResult();
        } catch (NoResultException e) {
            admin = null;
        } finally {
            session.close();
        }

        return admin;
    }

    // ✅ Rechercher un admin uniquement par email
    public Admin getAdminByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Admin admin = null;

        try {
            Query<Admin> query = session.createQuery(
                "from Admin where email = :email", Admin.class);
            query.setParameter("email", email);
            admin = query.getSingleResult();
        } catch (NoResultException e) {
            admin = null;
        } finally {
            session.close();
        }

        return admin;
    }

    // ✅ Ajouter un nouvel admin (Register)
    public void ajouterAdmin(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(admin);
        tx.commit();
        session.close();
    }
}
