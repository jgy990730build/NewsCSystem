package com.sise.jgy.action;

import com.opensymphony.xwork2.ActionSupport;

import com.sise.jgy.bean.Category;
import com.sise.jgy.dao.HibernateDao;
import com.sise.jgy.impl.HibernateDaoImpl;
import com.sise.jgy.service.C_N_ServiceDao;


import javax.annotation.Resource;
import java.util.List;


public class CategoryAction extends ActionSupport {
    @Resource private C_N_ServiceDao serviceDao;
    private  Integer cid;
    private Category category;
    private List<Category> categorys;
    private HibernateDao hibernateDao;

    public C_N_ServiceDao getServiceDao() {
        return serviceDao;
    }

    public void setServiceDao(C_N_ServiceDao serviceDao) {
        this.serviceDao = serviceDao;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public CategoryAction(){
    }

    public String add(){
        serviceDao.addCategory(category);
        return SUCCESS;
    }
    public String update(){
        serviceDao.UpdateCategory(category);
        return SUCCESS;
    }
    public String Find(){
       category = serviceDao.FindCategory(cid);
        return "update";
    }
    public String delete(){
        category = serviceDao.FindCategory(cid);
        serviceDao.deleteCategory(category);
        return SUCCESS;
    }
    public String list(){
        categorys = serviceDao.FindAllCategory();
        return "list";
    }
}
