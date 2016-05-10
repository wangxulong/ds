package com.wang.dto;

import java.math.BigInteger;
import java.util.List;

/**
 * Created by wxl on 2016/5/10.
 */
public class Pager {
    private Integer currentPage;
    private Integer pageSize;
    private BigInteger totalCount;
    private List results;

    public Pager(Integer currentPage, Integer pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }


    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public BigInteger getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(BigInteger totalCount) {
        this.totalCount = totalCount;
    }

    public List getResults() {
        return results;
    }

    public void setResults(List results) {
        this.results = results;
    }
}
