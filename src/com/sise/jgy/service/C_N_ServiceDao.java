package com.sise.jgy.service;

import com.sise.jgy.bean.Category;
import com.sise.jgy.bean.News;
import com.sise.jgy.bean.User;

import java.util.Date;
import java.util.List;

public interface C_N_ServiceDao {
    void addCategory(Category category);
    void UpdateCategory(Category category);
    Category FindCategory(Integer id);
    void deleteCategory(Category category);
    List<Category> FindAllCategory();
    void addNews(News news);
    List<News> findAllNews();
    void deleteNews(News news);
    News findNews(Integer id);
    void updateNews(News news);
    List<News> findNewByCategory(Integer id,int pageNo,int pageSize);
    User findUser(Integer id);
    List<News> findNewsByTime();
    List<News> findNewsByHot();
    List<News> findallNewsByPage( int pageNo, int pageSize);
    List<News> findSearchNewsByPage(String string,int pageNo,int pageSize);
    List<News> findTimeFrameByPage(Date time1, Date time2, int pageNo, int pageSize);
    long findCount();
    long findCountByC(Integer id);
    long findCountBySearch(String string);
    long findCountByTimeFrame(Date time1,Date time2);
}
