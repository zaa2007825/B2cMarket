package com.cjf.market.user.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.user.mapper.UserMapper;
import com.cjf.market.user.model.UserModel;

import sun.misc.BASE64Encoder;
@Service
public class UserService {
	@Autowired
	@Qualifier("userMapper")
	private UserMapper<UserModel> up;
	public String mmd(String str) {
		String password = "";
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base = new BASE64Encoder();
			password = base.encode(md5.digest(str.getBytes("UTF-8")));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException f) {
			f.printStackTrace();
		}
		return password;
	}
	public String login(UserModel um, String code, HttpSession session) {
		String i = "";
		UserModel um1 = new UserModel();
		um1.setAccount(um.getAccount());
		um1.setAdmin(um.getAdmin());
		um1.setPassword(mmd(um.getPassword()));
		List<UserModel> list = up.select(um1);
		if(list == null || list.isEmpty()) {
			i = "账号密码错误";
		}else if(!code.equals(session.getAttribute("code").toString())){
			i = "验证码错误";
		}else {
			i = "登陆成功";
		}
		
		if(i.equals("登陆成功") && list.get(0).getAdmin().equals("y")) {
			i = "管理员登录";
		}else if(i.equals("登陆成功") && list.get(0).getAdmin().equals("n")){
			i = "普通用户登录";
		}
		return i;
	}
	public int register(UserModel um) {
		int i = 0;
		UserModel um1 = new UserModel();
		um1.setAccount(um.getAccount());
		List<UserModel> list = up.select(um1);
		if(list == null || list.isEmpty()) {
			um1.setPassword(um.getPassword());
			um.setPassword(mmd(um1.getPassword()));
			i = up.insert(um);
		}
		return i; 
	}
	
	public List<UserModel> select(UserModel um) {	
		return up.select(um);
	}
	public int selectcount(UserModel um) {
		return up.count(um);
	}
	public int update(UserModel um) {
		int i = 0;
		up.update(um);
		return i;
	}
	public void delete(String account) {
		UserModel um = new UserModel();
		um.setAccount(account);
		up.delete(um);
	}
	public String add(UserModel um) {
		String i = "";
		UserModel umo = new UserModel();
		umo.setAccount(um.getAccount());
		List<UserModel> list = up.select(umo);
		if(list == null || list.isEmpty()) {
			i += up.insert(um);
		}else {
			i += 0;
		}
		return i;
	}
	
}
