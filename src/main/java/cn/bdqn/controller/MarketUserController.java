package cn.bdqn.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.bdqn.pojo.MarketUser;
import cn.bdqn.service.MarketUserService;
import cn.bdqn.util.Constants;

@Controller
public class MarketUserController {
	// 将service注入到controller中
	
	@Autowired
	private MarketUserService marketUserService;

	/**
	 * 
	 * @Description (进入登录界面)
	 * @return
	 */

	@RequestMapping("login.do")
	public String login() throws Exception {
		return "login";
	}

	/**
	 * 
	 * @Description (点击登录进入用户列表页面)
	 * @return
	 */
	@RequestMapping("userlist.do")
	public String userlist(HttpSession session) throws Exception {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "userlist";
	}

	/**
	 * 
	 * @Description (点击添加用户进入添加用户页面)
	 * @return
	 */
	@RequestMapping("useradd.do")
	public String useradd(HttpSession session) throws Exception {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "useradd";
	}

	/**
	 * 
	 * @param session
	 * @Description (点击查询用户进入查询用户页面)
	 * @return
	 */
	@RequestMapping("userview.do")
	public String userview(HttpSession session) throws Exception {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "userview";
	}

	/**
	 * 
	 * @Description (登录验证)
	 * @return
	 */
	@RequestMapping("loginAction.do")
	public String loginAction(MarketUser marketUser, HttpSession session)
			throws Exception {
		System.err.println("================loginAction.do");
		// 登录验证
		marketUser = marketUserService.getAllMarketUser(marketUser);
		// 判断登录是否成功
		if (marketUser == null) {
			System.err.println("=============login进来了");
			session.setAttribute("error", "用户名或者密码错误");
			// 失败
			return "redirect:login.do";
		} else {
			// 成功，将用户对象添加到session中，跳转到欢迎主界面
			session.setAttribute("marketUser", marketUser);// 将用户对象添加到session中
			session.setAttribute(Constants.USER_SESSION, marketUser);
			return "redirect:main";
		}
	}
	
	@RequestMapping(value = "main")
	public String main(HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "frame";
	}
	
	
	

	/**
	 * 查看所有用户信息
	 * 
	 * @param marketUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listUser.do")
	public @ResponseBody PageInfo<MarketUser> getSelectMarketUser(
			MarketUser marketUser, String username, Integer roleid,
			HttpServletRequest request, Integer startPage, Integer pageSize,
			HttpSession session) throws Exception {

		return marketUserService.getAllUserPage(marketUser, startPage,
				pageSize, username, roleid);
	}

	/**
	 * @throws Exception
	 *             添加用户信息
	 * 
	 * @param marketUser
	 * @return
	 * @throws
	 */
	@RequestMapping("/adduser.do")
	public String addUserById(MarketUser user) throws Exception {
		// System.err.println("===============================================updateUser.do");
		// user.setUsercode(user.getUsercode());
		// user.setUsername(user.getUsername());
		// user.setUserpassword(user.getUserpassword());
		// user.setGender(user.getGender());
		// //user.setBirthday(user.getBirthday());
		// user.setPhone(user.getPhone());
		// user.setAddress(user.getAddress());
		// user.setUserrole(user.getUserrole());
		System.err.println(user);
		int count = marketUserService.addUser(user);
		System.err.println(count);
		if (count == 1) {
			return "redirect:userlist.do";
		} else {
			return "useradd";
		}
	}

	/**
	 * @throws Exception
	 *             查询用户编码是否重复
	 * 
	 * @param marketUser
	 * @return
	 * @throws
	 */
	@RequestMapping("/findeUserCode.do")
	public @ResponseBody int findUserCode(HttpServletRequest request) {
		String usercode = request.getParameter("usercode");

		int count = marketUserService.findUserCode(usercode);

		return count;

	}

	/**
	 * 
	 * @Description (点击修改用户进入修改用户页面)
	 * @return
	 */
	@RequestMapping("updateUsers.do")
	public String updateUsers(Integer idno, HttpServletRequest request)
			throws Exception {
		MarketUser userById = marketUserService.getUserById(idno);
		HttpSession session = request.getSession();
		session.setAttribute("userById", userById);
		return "usermodify";

	}

	/**
	 * 修改用户信息
	 * 
	 * @param marketUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUser.do")
	public String updateUser(MarketUser marketUser, HttpServletRequest request)
			throws Exception {
		// System.err.println("===============================================updateUser.do");
		// marketUser.setIdno(marketUser.getIdno());
		// marketUser.setUsername(marketUser.getUsername());
		// marketUser.setGender(marketUser.getGender());
		// marketUser.setPhone(marketUser.getPhone());
		// marketUser.setAddress(marketUser.getAddress());
		// marketUser.setUserrole(marketUser.getUserrole());
		System.err.println(marketUser);
		int count = marketUserService.updateUser(marketUser);
		System.err.println(marketUser.getIdno());
		System.err.println(marketUser.getUsername());
		request.getSession().setAttribute("MarketUser", marketUser);
		if (count == 1) {
			return "redirect:userlist.do";
		} else {
			return "usermodify";
		}

	}

	/**
	 * 
	 * @Description (点击修改密码进入修改密码页面)
	 * @return
	 */
	@RequestMapping("pwdmodify.do")
	public String pwdmodify(HttpSession session) throws Exception {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "pwdmodify";
	}

	/**
	 * 修改用户密码
	 * @param marketUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUserpassword.do")
	public String updateUserpassword(MarketUser marketUser,
			HttpServletRequest request) throws Exception {
		System.err.println(marketUser);
		System.err
				.println("===========================================================================");
		int count = marketUserService.updateUserpassword(marketUser);
		System.err.println(marketUser.getIdno());
		System.err.println(marketUser.getUserpassword());
		System.err
				.println("===========================================================================");
		request.getSession().setAttribute("MarketUser", marketUser);
		System.err
				.println("===========================================================================");
		if (count == 1) {
			return "redirect:login.do";
		} else {
			return "pwdmodify";
		}
	}

	/**
	 * 查询对应id用户详细信息
	 * @param marketUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("viewUser.do")
	public String selectUser(Integer idno, HttpServletRequest request)
			throws Exception {
		MarketUser marketuser = marketUserService.getUserById(idno);
		request.getSession().setAttribute("user", marketuser);
		System.err.println(marketuser);
		return "userview";
	}

	/**
	 * 删除用户信息
	 * @param marketUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("deleteUser.do")
	public @ResponseBody Integer deleteUserById(Integer idno) throws Exception {

		Integer count = marketUserService.deleteUserById(idno);
		return count;

	}

	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "loginout")
	public String loginOut(HttpSession session) {
		System.out.println("loginout进来了！==========================");
		session.removeAttribute(Constants.USER_SESSION);
		return "login";

	}

}
