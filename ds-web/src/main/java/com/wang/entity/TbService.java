package com.wang.entity;
// Generated 2016-2-21 21:33:34 by Hibernate Tools 3.5.0.Final

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * TbService generated by hbm2java
 */
@Entity
@Table(name = "tb_service", catalog = "micro_service")
public class TbService implements java.io.Serializable {

	private Long id;
	private Long userId;
	private String title;
	private String description;
	private Long good;
	private Long bad;
	private Byte type;
	private Byte status;
	private Date createTime;
	private Long categoryId;
	private String tagId;

	public TbService() {
	}

	public TbService(Long userId, String title, String description, Long good, Long bad, Byte type, Byte status,
			Date createTime, Long categoryId, String tagId) {
		this.userId = userId;
		this.title = title;
		this.description = description;
		this.good = good;
		this.bad = bad;
		this.type = type;
		this.status = status;
		this.createTime = createTime;
		this.categoryId = categoryId;
		this.tagId = tagId;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "user_id")
	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Column(name = "title")
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", length = 1024)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "good")
	public Long getGood() {
		return this.good;
	}

	public void setGood(Long good) {
		this.good = good;
	}

	@Column(name = "bad")
	public Long getBad() {
		return this.bad;
	}

	public void setBad(Long bad) {
		this.bad = bad;
	}

	@Column(name = "type")
	public Byte getType() {
		return this.type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	@Column(name = "status")
	public Byte getStatus() {
		return this.status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "category_id")
	public Long getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "tag_id")
	public String getTagId() {
		return this.tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

}
