package by.it.academy.news.service;

import by.it.academy.news.bean.News;
import by.it.academy.news.service.exceptions.NewsServiceException;

import java.util.List;

public interface NewsService {
    List<News> getAllNews(int offset, int noOfRecords) throws NewsServiceException;

    News getSingleNews(int id) throws NewsServiceException;

    void updateNews(News news) throws NewsServiceException;

    void addNews(News news) throws NewsServiceException;

    void deleteNews(int id) throws NewsServiceException;

    int getNumberOfAllNews() throws NewsServiceException;
}
