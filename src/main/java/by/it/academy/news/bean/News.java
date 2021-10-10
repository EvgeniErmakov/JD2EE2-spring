package by.it.academy.news.bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "news")
public class News implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", updatable = false)
  private int id;

  @NotNull(message = "This field can not be null or empty")
  @Size(
      min = 5,
      max = 200,
      message = "The content of the field should be between 10 and 100 chars")
  @Column(name = "title")
  @Pattern(regexp = "(.){3,45}", message = "АХАХХАХАХАХАХА!!111")
  private String title;

  @NotNull(message = "This field can not be null or empty")
  @Size(
      min = 5,
      max = 1000,
      message = "The content of the field should be between 50 and 200 chars")
  @Column(name = "brief")
  private String brief;

  @NotNull(message = "This field can not be null or empty")
  @Size(
      min = 5,
      max = 5000,
      message = "The content of the field should be between 100 and 1000 chars")
  @Column(name = "content")
  private String body;

  @Column(name = "author", updatable = false)
  private String author;

  @Column(name = "date", updatable = false)
  private Date date;

  public News() {}

  public News(int id, String title, String brief, String body, String author, Date date) {
    this.id = id;
    this.title = title;
    this.brief = brief;
    this.body = body;
    this.author = author;
    this.date = date;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getBrief() {
    return brief;
  }

  public void setBrief(String brief) {
    this.brief = brief;
  }

  public String getBody() {
    return body;
  }

  public void setBody(String body) {
    this.body = body;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    News news = (News) o;

    if (id != news.id) return false;
    if (title != null ? !title.equals(news.title) : news.title != null) return false;
    if (brief != null ? !brief.equals(news.brief) : news.brief != null) return false;
    if (body != null ? !body.equals(news.body) : news.body != null) return false;
    if (author != null ? !author.equals(news.author) : news.author != null) return false;
    return date != null ? date.equals(news.date) : news.date == null;
  }

  @Override
  public int hashCode() {
    int result = id;
    result = 31 * result + (title != null ? title.hashCode() : 0);
    result = 31 * result + (brief != null ? brief.hashCode() : 0);
    result = 31 * result + (body != null ? body.hashCode() : 0);
    result = 31 * result + (author != null ? author.hashCode() : 0);
    result = 31 * result + (date != null ? date.hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "News{" + "id=" + id + ", title='" + title + '\'' + ", brief='" + brief + '\'' + ", body='"
        + body + '\'' + ", author='" + author + '\'' + ", date=" + date + '}';
  }
}
