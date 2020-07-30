package com.sise.jgy.dao;

import java.util.Date;
import java.util.List;

import com.sise.jgy.bean.Category;
import com.sise.jgy.bean.News;
import com.sise.jgy.bean.User;

public interface HibernateDao {
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
	 User findUser(Integer u_id);
	 List<News> findByPage(final String hql,final int pageNo,final int pageSize);
	 List<News> findNewsByTime();
	 List<News> findNewsByHot();
	 List<News> findallNewsByPage(int pageNo,int pageSize);
	 List<News> findSearchNewsByPage(String string,int pageNo,int pageSize);
	 List<News> findTimeFrameByPage(Date time1, Date time2, int pageNo, int pageSize);
	 long findCount(Class<News> newsClass);
	 long findCountByC(Class<News> newsClass,Integer id);
	 long findCountBySearch(Class<News> newsClass,String string);
	 long findCountByTimeFrame(Class<News> newsClass,Date time1,Date time2);
}
