package dao;

import model.Billet;
import model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class BilletDAO {

    // Ajouter un billet
    public void ajouterBillet(Billet billet) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(billet);
        tx.commit();
        session.close();
    }

    // Récupérer tous les billets d'un utilisateur
    public List<Billet> getBilletsParUtilisateur(int utilisateurId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Billet> query = session.createQuery(
            "FROM Billet WHERE utilisateur.id = :id ORDER BY dateReservation DESC", Billet.class);
        query.setParameter("id", utilisateurId);
        List<Billet> billets = query.list();
        session.close();
        return billets;
    }


    // Récupérer les billets marqués "utilisé"
    public List<Billet> getBilletsUtilises(int utilisateurId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Billet> query = session.createQuery(
            "FROM Billet WHERE utilisateur.id = :id AND utilise = true", Billet.class);
        query.setParameter("id", utilisateurId);
        List<Billet> billets = query.list();
        session.close();
        return billets;
    }

    // Récupérer les billets actifs (non utilisés)
    public List<Billet> getBilletsNonUtilises(int utilisateurId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Billet> query = session.createQuery(
            "FROM Billet WHERE utilisateur.id = :id AND utilise = false", Billet.class);
        query.setParameter("id", utilisateurId);
        List<Billet> billets = query.list();
        session.close();
        return billets;
    }

    // Récupérer les demandes d'annulation
    public List<Billet> getDemandesAnnulation() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Billet> query = session.createQuery(
            "FROM Billet WHERE annulationDemandee = true", Billet.class);
        List<Billet> billets = query.list();
        session.close();
        return billets;
    }

    // Modifier un billet (ex. confirmer annulation ou marquer utilisé)
    public void modifierBillet(Billet billet) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(billet);
        tx.commit();
        session.close();
    }

    // Supprimer un billet
    public void supprimerBillet(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Billet billet = session.get(Billet.class, id);
        if (billet != null) session.delete(billet);
        tx.commit();
        session.close();
    }

    // Récupérer un billet par son id
    public Billet getBilletById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Billet billet = session.get(Billet.class, id);
        session.close();
        return billet;
    }
    public List<Billet> getAllBillets() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Billet> billets = session.createQuery("FROM Billet", Billet.class).list();
        session.close();
        return billets;
    }

  

}
