package by.it.academy.news.service.exceptions;

public class NewsServiceException extends Exception {
  private static final long serialVersionUID = 1L;

  public NewsServiceException(Exception e) {
    super(e);
  }
}
