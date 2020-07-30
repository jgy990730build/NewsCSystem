package com.sise.jgy.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sise.jgy.bean.Category;
import com.sise.jgy.bean.News;

import com.sise.jgy.service.C_N_ServiceDao;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

public class NewsAction extends ActionSupport {
    @Resource private C_N_ServiceDao serviceDao;
    int i=1;//中间变量
    //新闻id
    private Integer nid;
    //查询状态
    private int sid=0;
    private Category category;
    private List<Category> categorys;
    private News news;
    //新闻list实体
    private List<News> newss;
    private List<News> newss2;
    //用于分页暂存变量
    private int number_count;
    private int pageNow =1;
    private int pageSize=7;
    private int k;//储存最大页面数
    private int intPageCount;
    //暂存string变量
    private String str1;
    private String str2;
    private Date date1;
    private Date date2;


//    private HibernateDao hibernateDao;


    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
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

    public News getNews() {
        return news;
    }

    public List<News> getNewss() {
        return newss;
    }

    public void setNewss(List<News> newss) {
        this.newss = newss;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public List<News> getNewss2() {
        return newss2;
    }

    public void setNewss2(List<News> newss2) {
        this.newss2 = newss2;
    }

    public int getNumber_count() {
        return number_count;
    }

    public void setNumber_count(int number_count) {
        this.number_count = number_count;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getIntPageCount() {
        return intPageCount;
    }

    public void setIntPageCount(int intPageCount) {
        this.intPageCount = intPageCount;
    }

    public int getK() {
        return k;
    }

    public void setK(int k) {
        this.k = k;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }

    public String getStr2() {
        return str2;
    }

    public void setStr2(String str2) {
        this.str2 = str2;
    }

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        this.date2 = date2;
    }

    public NewsAction(){
//        hibernateDao = new HibernateDaoImpl();
    }

    public String add(){
        categorys = serviceDao.FindAllCategory();
        return "add_news";
    }

    public String added(){
        category = serviceDao.FindCategory(nid);
        Date date = new Date();
        news.setCategoryName(category.getCategory());
        news.setIssueTime(date);
        news.setCategory(category);
        serviceDao.addNews(news);
        return SUCCESS;
    }

    public String findAll(){
        categorys = serviceDao.FindAllCategory();
        newss = serviceDao.findallNewsByPage(pageNow,pageSize);
        Pagecount_All();
        return "news_list";
    }

    public String detele(){
        news = serviceDao.findNews(nid);
        serviceDao.deleteNews(news);
        return SUCCESS;
    }
    public String findOne(){
        news = serviceDao.findNews(nid);
        return "find_one_news";
    }

    public String update(){
        news = serviceDao.findNews(nid);
        categorys = serviceDao.FindAllCategory();
        return "update";
    }

    public String updated(){
        serviceDao.updateNews(news);
        return SUCCESS;
    }

    public String findbyC(){
        if(sid==0){
            newss = serviceDao.findallNewsByPage(pageNow,pageSize);
            Pagecount_All();
        }else {
            newss = serviceDao.findNewByCategory(sid,pageNow,pageSize);
            Pagecount(sid);
        }
        categorys = serviceDao.FindAllCategory();
        return "list_byCategory";
    }

    public String index(){
        number_count = (int)serviceDao.findCount();
        categorys = serviceDao.FindAllCategory();
        newss = serviceDao.findNewsByTime();
        newss2 = serviceDao.findNewsByHot();
        return "index";
    }
    public String show(){
        categorys = serviceDao.FindAllCategory();
        news = serviceDao.findNews(nid);
        return "show";
    }
    public String showByC(){
        newss = serviceDao.findNewByCategory(nid,pageNow,pageSize);
        categorys = serviceDao.FindAllCategory();
        category = serviceDao.FindCategory(nid);
        Pagecount(nid);
        return "showbyc";
    }
    public String showAllnews(){
        newss = serviceDao.findallNewsByPage(pageNow,pageSize);
        categorys = serviceDao.FindAllCategory();
        Pagecount_All();
        return "show_all_news";
    }
    //查看搜索结果
    public String showSearchResult(){
        newss = serviceDao.findSearchNewsByPage(str1,pageNow,pageSize);
        categorys = serviceDao.FindAllCategory();
        PageSeachResult(str1);
        return "show_search_result";
    }
    //查看以时间范围
    public String showTimeFrameResult(){
        if(sid==0){
            newss = serviceDao.findallNewsByPage(pageNow,pageSize);
            Pagecount_All();
        }else{
            newss = serviceDao.findTimeFrameByPage(date1,date2,pageNow,pageSize);
            PageTimeFrame(date1,date2);
        }
        categorys = serviceDao.FindAllCategory();
        return "show_time_frame_result";
    }


    //分页用
    private void Pagecount_All() {
        number_count = (int)serviceDao.findCount();
        Count();
    }

    private void Pagecount(Integer id) {
        number_count = (int)serviceDao.findCountByC(id);
        Count();
    }

    private void PageSeachResult(String string){
        number_count = (int)serviceDao.findCountBySearch(string);
        Count();
    }

    private void PageTimeFrame(Date time1,Date time2){
        number_count = (int)serviceDao.findCountByTimeFrame(time1,time2);
        Count();
    }

    private void Count() {
        k=(number_count + pageSize - 1) / pageSize;
        intPageCount = (number_count+pageSize-1) / pageSize;
        if(pageNow<1){
            pageNow=1;
        }
        if(pageNow > intPageCount)
            pageNow=intPageCount;
        i = (pageNow-1)*pageSize;
    }
}
