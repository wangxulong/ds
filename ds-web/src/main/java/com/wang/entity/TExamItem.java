package com.wang.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_exam_item", schema = "ds")
public class TExamItem {
    private Integer id;
    private String name;
    private String desc;
    private Integer examId;
    private Integer attachmentId;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "desc")
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Basic
    @Column(name = "exam_id")
    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    @Basic
    @Column(name = "attachment_id")
    public Integer getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TExamItem tExamItem = (TExamItem) o;

        if (id != null ? !id.equals(tExamItem.id) : tExamItem.id != null) return false;
        if (name != null ? !name.equals(tExamItem.name) : tExamItem.name != null) return false;
        if (desc != null ? !desc.equals(tExamItem.desc) : tExamItem.desc != null) return false;
        if (examId != null ? !examId.equals(tExamItem.examId) : tExamItem.examId != null) return false;
        if (attachmentId != null ? !attachmentId.equals(tExamItem.attachmentId) : tExamItem.attachmentId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (desc != null ? desc.hashCode() : 0);
        result = 31 * result + (examId != null ? examId.hashCode() : 0);
        result = 31 * result + (attachmentId != null ? attachmentId.hashCode() : 0);
        return result;
    }
}
