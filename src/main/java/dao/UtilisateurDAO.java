package dao;

import model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;
import jakarta.persistence.NoResultException;

import java.util.List; 
public class UtilisateurDAO {

    // Connexion utilisateur
    public Utilisateur getUtilisateurByEmailAndPassword(String email, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Utilisateur utilisateur = null;

        try {
            Query<Utilisateur> query = session.createQuery(
                "from Utilisateur where email = :email and password = :password", Utilisateur.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            utilisateur = query.getSingleResult();
        } catch (NoResultException e) {
            utilisateur = null;
        } finally {
            session.close();
        }

        return utilisateur;
    }

    // Vérifie si l'email existe déjà
    public Utilisateur getUtilisateurByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Utilisateur utilisateur = null;

        try {
            Query<Utilisateur> query = session.createQuery(
                "from Utilisateur where email = :email", Utilisateur.class);
            query.setParameter("email", email);
            utilisateur = query.getSingleResult();
        } catch (NoResultException e) {
            utilisateur = null;
        } finally {
            session.close();
        }

        return utilisateur;
    }

    // Inscription
    public void ajouterUtilisateur(Utilisateur utilisateur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(utilisateur);
        tx.commit();
        session.close();
    }
    public void modifierUtilisateur(Utilisateur utilisateur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.update(utilisateur);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    
    }
    public List<Utilisateur> getAllUtilisateurs() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Utilisateur> utilisateurs = session.createQuery("FROM Utilisateur", Utilisateur.class).list();
        session.close();
        return utilisateurs;
    }
    public Utilisateur getUtilisateurById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Utilisateur utilisateur = session.get(Utilisateur.class, id);
        session.close();
        return utilisateur;
    }



}
