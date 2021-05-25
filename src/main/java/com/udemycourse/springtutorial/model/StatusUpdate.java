package com.udemycourse.springtutorial.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name="status_update")
public class StatusUpdate {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Size(min = 5, max = 255, message = "{addStatus.text.size}")
    @NotBlank(message = "{addStatus.text.blank}")
    private String text;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date added;

    @PrePersist
    protected void onCreate(){
        if(added == null) {
            added = new Date();
        }
    }

    public StatusUpdate(){

    }

    public StatusUpdate(String text) {
        this.text = text;
    }

    public StatusUpdate(String text, Date added) {
        this.text = text;
        this.added = added;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getAdded() {
        return added;
    }

    public void setAdded(Date added) {
        this.added = added;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StatusUpdate that = (StatusUpdate) o;
        return id.equals(that.id) &&
                Objects.equals(text, that.text) &&
                Objects.equals(added, that.added);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, text, added);
    }

    @Override
    public String toString() {
        return "StatusUpdate{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", added=" + added +
                '}';
    }
}
