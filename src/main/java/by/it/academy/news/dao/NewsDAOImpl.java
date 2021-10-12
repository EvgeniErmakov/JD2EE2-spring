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
    private static final String SELECT_ALL_NEWS_QUERY = "from News where status ='pushed'";
    private static final String SELECT_ALL_OFFERED_NEWS_QUERY = "from News where status ='offered'";
    private static final String DELETE_NEWS_WITH_ID_QUERY = "delete from News where id=:id";
    private static final String PUBLISH_NEWS_WITH_ID_QUERY = "update News SET status = 'pushed' where id=:id";
    private static final String SELECT_COUNT_OF_NEWS_QUERY = "select count(all id) from News  where status ='pushed'";
    private static final String SELECT_COUNT_OF_OFFERED_NEWS_QUERY = "select count(all id) from News  where status ='offered'";

    @Override
    public List<News> getAllNews(int offset, int noOfRecords) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<News> query = currentSession.createQuery(SELECT_ALL_NEWS_QUERY, News.class);

        try {
            return query.setFirstResult(offset).setMaxResults(noOfRecords).getResultList();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }


    @Override
    public void updateNews(final News news) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();

        try {
            currentSession.update(news);
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public int getNumberOfAllNews() throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Long> theQuery = currentSession.createQuery(SELECT_COUNT_OF_NEWS_QUERY, Long.class);

        try {
            return theQuery.getResultList().get(0).intValue();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public List<News> getAllOfferedNews(int offset, int noOfRecords) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<News> query = currentSession.createQuery(SELECT_ALL_OFFERED_NEWS_QUERY, News.class);
        try {
            return query.setFirstResult(offset).setMaxResults(noOfRecords).getResultList();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }


    @Override
    public int getNumberOfAllOfferedNews() throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Long> theQuery = currentSession.createQuery(SELECT_COUNT_OF_OFFERED_NEWS_QUERY, Long.class);

        try {
            return theQuery.getResultList().get(0).intValue();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public News getSingleNews(final int id) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();

        try {
            return currentSession.get(News.class, id);
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void deleteNews(int id) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();

        try {
            Query query = currentSession.createQuery(DELETE_NEWS_WITH_ID_QUERY);
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void addNews(News news) {
        Session currentSession = sessionFactory.getCurrentSession();
        news.setAuthor(null);
        news.setDate(null);
        news.setStatus("pushed");
        currentSession.save(news);
    }

    @Override
    public void offerNews(News news) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        news.setAuthor(null);
        news.setDate(null);
        news.setStatus("offered");
        currentSession.save(news);
    }


    @Override
    public void publishNews(int id) throws DAOException {
        Session currentSession = sessionFactory.getCurrentSession();
        try {
            Query query = currentSession.createQuery(PUBLISH_NEWS_WITH_ID_QUERY);
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (RuntimeException e) {
            throw new DAOException(e);
        }
    }
}
