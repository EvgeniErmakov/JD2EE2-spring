package by.it.academy.news.dao;

import by.it.academy.news.bean.News;
import by.it.academy.news.dao.exceptions.DAOException;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewsDAOImpl implements NewsDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<News> getAllNews(int offset, int noOfRecords) throws DAOException {
        final Session currentSession = sessionFactory.getCurrentSession();
        final Query<News> query = currentSession.createQuery("from News order by date", News.class);

        try {
            return query.setFirstResult(offset).setMaxResults(noOfRecords).getResultList();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public News getSingleNews(final int id) throws DAOException {
        final Session currentSession = sessionFactory.getCurrentSession();

        try {
            return currentSession.get(News.class, id);
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void updateNews(final News news) throws DAOException {
        final Session currentSession = sessionFactory.getCurrentSession();

        try {
            currentSession.update(news);
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void deleteNews(int id) throws DAOException {
        final Session currentSession = sessionFactory.getCurrentSession();

        try {
            final Query query = currentSession.createQuery("delete from News where id=:id");
            query.setParameter("id", id);

            query.executeUpdate();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public int getNumberOfAllNews() throws DAOException {
        final Session currentSession = sessionFactory.getCurrentSession();
        final Query<Long> theQuery =
                currentSession.createQuery("select count(all n.id) from News n", Long.class);

        try {
            return theQuery.getResultList().get(0).intValue();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void addNews(News news) {
        final Session currentSession = sessionFactory.getCurrentSession();
        news.setAuthor("213");
        news.setDate(null);
        currentSession.save(news);
    }

}
