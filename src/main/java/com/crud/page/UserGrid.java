package com.crud.page;

import java.util.List;

public class UserGrid<User> {
    private int totalPages;
    private int currentPage;
    private long totalRecords;
    private List<User> userData;
    private int maxPerPage;

    public int getTotalPages() {
        return totalPages;
    }

    public UserGrid(List<User> userData, int currentPage, int totalPages, int maxPerPage) {
        this.totalPages = totalPages;
        this.currentPage = currentPage;
        this.maxPerPage = maxPerPage;
        this.userData = userData;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public long getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(long totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<User> getUserData() {
        return userData;
    }

    public void setUserData(List<User> userData) {
        this.userData = userData;
    }

    public int getMaxPerPage() {
        return maxPerPage;
    }

    public void setMaxPerPage(int maxPerPage) {
        this.maxPerPage = maxPerPage;
    }
}
