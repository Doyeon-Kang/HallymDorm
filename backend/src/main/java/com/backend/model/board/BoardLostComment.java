package com.backend.model.board;

import java.time.LocalDateTime;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "board_lost_comments")
public class BoardLostComment {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_lost_comments_generator")
    @Column(name="id")
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="content")
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name="writer_studentno")
    private String writer_studentno;

    public String getWriter_studentno() {
        return writer_studentno;
    }

    public void setWriter_studentno(String writer_studentno) {
        this.writer_studentno = writer_studentno;
    }

    @Column(name="writer_name")
    private String writer_name;

    public String getWriter_name() {
        return writer_name;
    }

    public void setWriter_name(String writer_name) {
        this.writer_name = writer_name;
    }

    @Basic(optional=false)
    @Column(name="createdDate", updatable = false)
    @JsonFormat(pattern="yyyy-MM-dd HH:mm")
    private LocalDateTime createdDate;

    @PrePersist
    private void onCreate() {   
        this.createdDate = LocalDateTime.now();
    }


    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setDate(LocalDateTime date) {
        this.createdDate = date;
    }

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "boardLost", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private BoardLost boardLost;

    public BoardLost getBoardLost() {
        return boardLost;
    }

    public void setBoardLost(BoardLost boardLost) {
        this.boardLost = boardLost;
    }

    public BoardLostComment() {

    }

    public BoardLostComment(String writer_studentno, String writer_name, String content) {
        this.content = content;
        this.writer_studentno = writer_studentno;
        this.writer_name = writer_name;
    }
}
