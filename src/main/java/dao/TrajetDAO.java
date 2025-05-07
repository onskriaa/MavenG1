package dao;

import model.Trajet;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class TrajetDAO {

    // ➕ Méthode pour ajouter un trajet
	public void ajouterTrajet(Trajet trajet) {
	    Transaction tx = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        tx = session.beginTransaction();
	        session.save(trajet); // <-- C'est CETTE ligne qui insère les données dans la table
	        tx.commit();
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.printStackTrace();
	    }
	}


    // 📥 Méthode pour récupérer tous les trajets
    public List<Trajet> getAllTrajets() {
        List<Trajet> trajets = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            trajets = session.createQuery("from Trajet", Trajet.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return trajets;
    }

}
