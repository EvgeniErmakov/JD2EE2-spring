package by.it.academy.news.dao;

import by.it.academy.news.bean.News;
import by.it.academy.news.dao.exceptions.DAOException;

import java.util.List;

public interface NewsDAO {
    List<News> getAllNews(int offset, int noOfRecords) throws DAOException;

    News getSingleNews(int id) throws DAOException;

    void updateNews(News news) throws DAOException;

    void publishNews(int id) throws DAOException;

    void addNews(News news) throws DAOException;

    void offerNews(News news) throws DAOException;

    void deleteNews(int id) throws DAOException;

    int getNumberOfAllNews() throws DAOException;

    List<News> getAllOfferedNews(int offset, int noOfRecords) throws DAOException;

    int getNumberOfAllOfferedNews() throws DAOException;
}
