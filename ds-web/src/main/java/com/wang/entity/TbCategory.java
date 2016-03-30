package com.wang.entity;
// Generated 2016-2-21 21:33:34 by Hibernate Tools 3.5.0.Final

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * TbCategory generated by hbm2java
 */
@Entity
@Table(name = "tb_category", catalog = "micro_service")
public class TbCategory  implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected  Long id;

	@Column(name = "title")
	private String title;
	@Column(name = "description")
	private String description;
	@Column(name = "parent_id")
	private Long parentId;
	@Column(name = "status")
	private Byte status;
	@Column(name = "create_time")
	private Date createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
