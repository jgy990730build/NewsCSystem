package com.sise.jgy.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Category implements Serializable {

    private Integer id;

    private String category;

    private Set<News> newses = new HashSet<News>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Set getNewses() {
        return newses;
    }

    public void setNewses(Set newses) {
        this.newses = newses;
    }
}
