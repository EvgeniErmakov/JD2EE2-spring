package by.it.academy.news.dao.exceptions;

public class DAOException extends Exception {
  private static final long serialVersionUID = 1L;

  public DAOException(Exception e) {
    super(e);
  }
}
