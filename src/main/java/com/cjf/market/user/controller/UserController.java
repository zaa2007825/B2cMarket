package com.cjf.market.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjf.market.user.model.UserModel;
import com.cjf.market.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService us;

	
	@RequestMapping(value = "login", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String login(UserModel um, String code, HttpSession session) {
		String m = "";
		m = us.login(um, code, session);
		if(m.equals("普通用户登录") || m.equals("管理员登录")) {
			UserModel umo = new UserModel();
			umo.setAccount(um.getAccount());
			List<UserModel> list = us.select(umo);
			session.setAttribute("per", list.get(0));
			System.out.println(list.get(0));
		}
		System.out.println(m);
		return m;
	}
	@RequestMapping(value = "register", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String register(String account, String password, String password1, String username) {
		String m = "";
		UserModel um = new UserModel();
		um.setAccount(account);
		um.setPassword(password);
		um.setUsername(username);
		um.setAdmin("n");
		if(password.equals(password1)) {
			m += us.register(um);
		}else {
			m += 2;
		}
		return m;
	}
	@RequestMapping(value = "select", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String select(UserModel um) {
		UserModel umo = new UserModel();
		umo.setAccount("%"+um.getAccount()+"%");
		umo.setPageOn(true);
		umo.setPageIndex(um.getPageIndex());
		umo.setPageLimit(um.getPageLimit());
		List<UserModel> list = us.select(umo);
		int count = us.selectcount(umo);
		JSONObject jso = new JSONObject();
		jso.put("list", list);
		jso.put("count", count);
		return jso.toString();
	}
	@RequestMapping(value = "add", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String add(UserModel um) {
		return us.add(um);
	}
	@RequestMapping("/delete")
	public String delete(String account) {
		us.delete(account);
		return "jsp/AdminIndex";
	}
	@RequestMapping("/openupdate")
	public String openupdate(UserModel um, Model model) {
		List<UserModel> list = us.select(um);
		UserModel um1 = new UserModel();
		model.addAttribute("updac", um1.getAccount());
		model.addAttribute("updna", um1.getUsername());
		return "jsp/Update";
	}
	@RequestMapping(value = "update", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String update(UserModel um) {
		String i = "";
		int a = us.update(um);
		i += a;
		return i;
	}
	@RequestMapping("/openupdateysf")
	public String openupdateysf(UserModel um, Model model) {
		List<UserModel> list = us.select(um);
		model.addAttribute("updysfac", list.get(0).getAccount());
		model.addAttribute("updysfna", list.get(0).getUsername());
		return "jsp/Updateysf";
	}
	@RequestMapping(value = "updatepassword", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String updatepassword(String account, String oldpassword, String newpassword, String newpassword1) {
		String i = "";
		if(newpassword.equals(newpassword1)) {
			i += 0;
		}else if(newpassword.equals(oldpassword)) {
			i += 2;
		}else {
			UserModel um = new UserModel();
			um.setAccount(account);
			um.setPassword(newpassword);
			i += us.update(um);
		}
		return i;
	}
	@RequestMapping("/openupdatepas")
	public String openupdatepas(UserModel um, Model model) {
		List<UserModel> list = us.select(um);
		model.addAttribute("updpasac", list.get(0).getAccount());
		model.addAttribute("updpasna", list.get(0).getUsername());
		return "jsp/UpdatePassword";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("per");
		return "Login";
	}
}
