package com.sise.jgy.service;

import com.sise.jgy.bean.Category;
import com.sise.jgy.bean.News;
import com.sise.jgy.bean.User;
import com.sise.jgy.dao.HibernateDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("c_n_Service")
@Transactional(readOnly = false)
public class C_N_Service implements C_N_ServiceDao{
    @Resource private HibernateDao dao;
    @Override
    public void addCategory(Category category) {
        dao.addCategory(category);
    }

    @Override
    public void UpdateCategory(Category category) {
        dao.UpdateCategory(category);
    }

    @Override
    public Category FindCategory(Integer id) {
        return dao.FindCategory(id);
    }

    @Override
    public void deleteCategory(Category category) {
        dao.deleteCategory(category);
    }

    @Override
    public List<Category> FindAllCategory() {
        return dao.FindAllCategory();
    }

    @Override
    public void addNews(News news) {
        dao.addNews(news);
    }

    @Override
    public List<News> findAllNews() {
        return dao.findAllNews();
    }

    @Override
    public void deleteNews(News news) {
        dao.deleteNews(news);
    }

    @Override
    public News findNews(Integer id) {
        return dao.findNews(id);
    }

    @Override
    public void updateNews(News news) {
        dao.updateNews(news);
    }

    @Override
    public List<News> findNewByCategory(Integer id,int pageNo,int pageSize) {
        return dao.findNewByCategory(id,pageNo,pageSize);
    }

    @Override
    public User findUser(Integer id) {
        return dao.findUser(id);
    }
    //按最新的时间查询最新新闻
    @Override
    public List<News> findNewsByTime() {
        return dao.findNewsByTime();
    }

    //查询按热度
    @Override
    public List<News> findNewsByHot() {
        return dao.findNewsByHot();
    }
    //查询所有按页数
    @Override
    public List<News> findallNewsByPage( int pageNo, int pageSize) {
        return dao.findallNewsByPage(pageNo,pageSize);
    }
    //模糊查询
    @Override
    public List<News> findSearchNewsByPage(String string, int pageNo, int pageSize) {
        return dao.findSearchNewsByPage(string,pageNo,pageSize);
    }
    //时间范围查询
    @Override
    public List<News> findTimeFrameByPage(Date time1, Date time2, int pageNo, int pageSize) {
        return dao.findTimeFrameByPage(time1,time2,pageNo,pageSize);
    }

    //计算记录总数
    @Override
    public long findCount() {
        return dao.findCount(News.class);
    }

    @Override
    public long findCountByC(Integer id) {
        return dao.findCountByC(News.class,id);
    }

    @Override
    public long findCountBySearch(String string) {
        return dao.findCountBySearch(News.class,string);
    }

    @Override
    public long findCountByTimeFrame(Date time1, Date time2) {
        return dao.findCountByTimeFrame(News.class,time1,time2);
    }
}
