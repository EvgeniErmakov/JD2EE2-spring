package by.it.academy.news.service;

import by.it.academy.news.bean.News;
import by.it.academy.news.dao.NewsDAO;
import by.it.academy.news.dao.exceptions.DAOException;
import by.it.academy.news.service.exceptions.NewsServiceException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NewsServiceImpl implements NewsService {
  @Autowired private NewsDAO newsDAO;

  @Transactional
  @Override
  public List<News> getAllNews(int offset, int noOfRecords) throws NewsServiceException {
    try {
      return newsDAO.getAllNews(offset, noOfRecords);
    } catch (DAOException e) {
      throw new NewsServiceException(e);
    }
  }

  @Transactional
  @Override
  public News getSingleNews(final int id) throws NewsServiceException {
    try {
      return newsDAO.getSingleNews(id);
    } catch (DAOException e) {
      throw new NewsServiceException(e);
    }
  }

  @Transactional
  @Override
  public void updateNews(final News news) throws NewsServiceException {
    try {
      newsDAO.updateNews(news);
    } catch (DAOException e) {
      throw new NewsServiceException(e);
    }
  }

  @Transactional
  @Override
  public void deleteNews(int id) throws NewsServiceException {
    try {
      newsDAO.deleteNews(id);
    } catch (DAOException e) {
      throw new NewsServiceException(e);
    }
  }

  @Transactional
  @Override
  public int getNumberOfAllNews() throws NewsServiceException {
    try {
      return newsDAO.getNumberOfAllNews();
    } catch (DAOException e) {
      throw new NewsServiceException(e);
    }
  }
}
