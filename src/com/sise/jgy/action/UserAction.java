package com.sise.jgy.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sise.jgy.bean.User;
import com.sise.jgy.service.C_N_ServiceDao;

import javax.annotation.Resource;
import java.util.List;

public class UserAction extends ActionSupport {
    @Resource private C_N_ServiceDao serviceDao;
    private Integer login_u_id;
    private String login_password;
    private User user;
    private List<User> users;

    public C_N_ServiceDao getServiceDao() {
        return serviceDao;
    }

    public void setServiceDao(C_N_ServiceDao serviceDao) {
        this.serviceDao = serviceDao;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Integer getLogin_u_id() {
        return login_u_id;
    }

    public void setLogin_u_id(Integer login_u_id) {
        this.login_u_id = login_u_id;
    }

    public String getLogin_password() {
        return login_password;
    }

    public void setLogin_password(String login_password) {
        this.login_password = login_password;
    }

    public String login(){
        user=serviceDao.findUser(login_u_id);
        if(user == null){
            return INPUT;
        }else if(!user.getPassword().equals(login_password)){
            this.addActionError("用户名或密码输入错误，请重新输入！");
            return INPUT;
        }
        return LOGIN;
    }

    public String loginout(){
        return "out";
    }
}
