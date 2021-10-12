package by.it.academy.news.bean;

import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "news")
public class News implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", updatable = false)
  private int id;

  @NotNull(message = "This field can not be null or empty")
  @Column(name = "title")
  @Pattern(regexp = "(.){3,200}", message = "The title must be between 3 and 200 chars")
  private String title;

  @NotNull(message = "This field can not be null or empty")
  @Pattern(regexp = "(.){50,1000}", message = "The brief must be between 50 and 1000 chars")
  @Column(name = "brief")
  private String brief;

  @NotNull(message = "This field can not be null or empty")
  @Pattern(regexp = "(.){50,5000}", message = "The content must be between 50 and 5000 chars")
  @Column(name = "content")
  private String body;

  @Column(name = "author", updatable = false)
  private String author;

  @Column(name = "date", updatable = false)
  private Date date;

  @Column(name = "status", updatable = false)
  private String status;


  public News() {}

  public News(int id, String title, String brief, String body, String author, Date date, String status) {
    this.id = id;
    this.title = title;
    this.brief = brief;
    this.body = body;
    this.author = author;
    this.date = date;
    this.status = status;
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

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof News)) return false;

    News news = (News) o;

    if (getId() != news.getId()) return false;
    if (!getTitle().equals(news.getTitle())) return false;
    if (!getBrief().equals(news.getBrief())) return false;
    if (!getBody().equals(news.getBody())) return false;
    if (!getAuthor().equals(news.getAuthor())) return false;
    if (!getDate().equals(news.getDate())) return false;
    return getStatus().equals(news.getStatus());
  }

  @Override
  public int hashCode() {
    int result = id;
    result = 31 * result + (title != null ? title.hashCode() : 0);
    result = 31 * result + (brief != null ? brief.hashCode() : 0);
    result = 31 * result + (body != null ? body.hashCode() : 0);
    result = 31 * result + (author != null ? author.hashCode() : 0);
    result = 31 * result + (date != null ? date.hashCode() : 0);
    result = 31 * result + (status != null ? status.hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "News{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", brief='" + brief + '\'' +
            ", body='" + body + '\'' +
            ", author='" + author + '\'' +
            ", date=" + date +
            ", status='" + status + '\'' +
            '}';
  }
}
