package com.sise.jgy.impl;


import com.sise.jgy.bean.Category;
import com.sise.jgy.bean.News;
import com.sise.jgy.bean.User;
import com.sise.jgy.dao.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sise.jgy.dao.HibernateDao;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class HibernateDaoImpl extends HibernateDaoSupport implements HibernateDao{

	@Override
	public void addCategory(Category category) {
		getHibernateTemplate().persist(category);
	}

	@Override
	public void UpdateCategory(Category category) {
		getHibernateTemplate().update(category);
	}

	@Override
	public Category FindCategory(Integer id) {
		return getHibernateTemplate().get(Category.class,id);
	}

	@Override
	public void deleteCategory(Category category) {
		getHibernateTemplate().delete(category);
	}

	@Override
	public List<Category> FindAllCategory() {
		return (List<Category>) getHibernateTemplate().find("from Category");
	}

	@Override
	public void addNews(News news) {
		getHibernateTemplate().persist(news);
	}

	@Override
	public List<News> findAllNews() {
		return (List<News>) getHibernateTemplate().find("from News ");
	}

    @Override
    public void deleteNews(News news) {
		getHibernateTemplate().delete(news);
    }

	@Override
	public News findNews(Integer id) {
		return getHibernateTemplate().get(News.class,id);
	}

	@Override
	public void updateNews(News news) {
		getHibernateTemplate().update(news);
	}

	@Override
	public List<News> findNewByCategory(Integer id,int pageNo,int pageSize) {
		Category category = getHibernateTemplate().get(Category.class,id);
		String HQL="from News where c_id = "+category.getId()+" order by issueTime desc";
		return (List<News>) findByPage(HQL,pageNo,pageSize);
	}

	@Override
	public User findUser(Integer u_id) {
		return getHibernateTemplate().get(User.class,u_id);
	}

	@Override
	public List<News> findByPage(String hql, int pageNo, int pageSize) {
		List<News> list = getHibernateTemplate().execute(new HibernateCallback<List<News>>() {
			@Override
			public List<News> doInHibernate(Session session) throws HibernateException {
				List<News> result = session.createQuery(hql).setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize).getResultList();

				return result;
			}
		});
		return list;
	}
	@Override
	public List<News> findNewsByTime(){
		String hql = "from News order by issueTime desc";
		return findByPage(hql,1,6);
	}
	//改良方法

	//查询热度最大（占时用随机查询）
	@Override
	public List<News> findNewsByHot() {
		String hql = "from News order by rand() desc";
		return findByPage(hql,1,6);
	}

	//分页并查找全部
	@Override
	public List<News> findallNewsByPage(int pageNo, int pageSize) {
		String hql = "from News order by issueTime desc";
		return findByPage(hql,pageNo,pageSize);
	}

	//模糊查询
	@Override
	public List<News> findSearchNewsByPage(String string, int pageNo, int pageSize) {
		String hql = "from News where title like '%"+string+"%' order by issueTime desc";
		return findByPage(hql,pageNo,pageSize);
	}

	//按时间范围查询
	@Override
	public List<News> findTimeFrameByPage(Date time1, Date time2, int pageNo, int pageSize) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String timeFormat1 = sdf.format(time1);
			String timeFormat2 = sdf.format(time2);
			String hql = "from News where issueTime between \'"+timeFormat1+"\' and \'"+timeFormat2+"\' order by issueTime desc";
			return findByPage(hql,pageNo,pageSize);
	}

	//计算记录总数
	@Override
	public long findCount(Class<News> newsClass) {
		List<Long> list = (List<Long>) getHibernateTemplate().find("select count(*) from "+newsClass.getSimpleName()+" en");
		return list.get(0);
	}


	@Override
	public long findCountByC(Class<News> newsClass,Integer id) {
		Category category = getHibernateTemplate().get(Category.class,id);
		String HQL="select count(*) from News where c_id = "+category.getId();
		List<Long> list = (List<Long>) getHibernateTemplate().find(HQL);
		return list.get(0);
	}

	@Override
	public long findCountBySearch(Class<News> newsClass, String string) {
		String HQL="select count(*) from News where title like '%"+string+"%'";
		List<Long> list = (List<Long>) getHibernateTemplate().find(HQL);
		return list.get(0);
	}

	@Override
	public long findCountByTimeFrame(Class<News> newsClass,Date time1,Date time2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String timeFormat1 = sdf.format(time1);
		String timeFormat2 = sdf.format(time2);
		String HQL="select count(*) from News where issueTime between \'"+timeFormat1+"\' and \'"+timeFormat2+"\'";
		List<Long> list = (List<Long>) getHibernateTemplate().find(HQL);
		return list.get(0);
	}

}
