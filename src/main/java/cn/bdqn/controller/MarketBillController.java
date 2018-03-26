package cn.bdqn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.bdqn.pojo.MarketBill;
import cn.bdqn.service.MarketBillService;
import cn.bdqn.util.Constants;

/**
 * @ClassName Text
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author 向恒山
 * @Date 创建时间 2017年9月22日上午8:41:44
 * @version 1.0.0
 **/
@Controller
public class MarketBillController {

	@Autowired
	private MarketBillService marketBill;

	/**
	 * 
	 * @Description (动态查询)
	 * @param bill
	 * @param model
	 * @param session
	 * @return
	 */

	// @RequestMapping("/getBillByParements.do")
	// public String getBillByParements(MarketBill bill, Model model,
	// HttpSession session) {
	// System.out.println(bill);
	// List<MarketBill> list = marketBill.getMarketBillByParements(bill);
	// System.err.println(list);
	// session.setAttribute("billlist", list);
	// return "billlist";
	//
	// }

	@RequestMapping("/getBillByParements.do")
	public @ResponseBody PageInfo<MarketBill> getAllBillPage(MarketBill bill,
			String productname, Integer providerid, Integer ispayment,
			Integer startPage, Integer pageSize) {

		return marketBill.getAllBillPage(bill, productname, providerid,
				ispayment, startPage, pageSize);
	}

	/**
	 * @Description (点击查看执行根据idno查看用户信息 并存入session在页面取值)
	 * @param idno
	 * @param request
	 * @return
	 */
	@RequestMapping("selectBill.do")
	public String selectBill(Integer idno, HttpServletRequest request,
			Model model) {
		MarketBill marketbill = marketBill.selectBillById(idno);
		model.addAttribute("bill", marketbill);
		return "billview";

	}

	/**
	 * @Description (点击删除执行删除方法 返回1则删除成功 刷新本界面)
	 * @param idno
	 * @return
	 */
	@RequestMapping("/deletebill.do")
	public @ResponseBody int deleteBill(HttpServletRequest request) {
		String idno = request.getParameter("idno");
		System.err.println(idno);
		int count = marketBill.deleteBillById(Integer.parseInt(idno));
		System.err.println(count);
		// if (count == 1) {
		// return "redirect:billlist.do";
		// }
		// return "billlist";
		return count;
	}

	/**
	 * @Description (新增方法返回1则跳转所有订单界面 否则还是在本页面)
	 * @param bill
	 * @return
	 */
	@RequestMapping("/add.do")
	public String addBillById(MarketBill bill) {

		int count = marketBill.addBill(bill);
		System.err.println(count);
		if (count == 1) {
			return "redirect:billlist.do";
		} else {
			return "billadd";
		}
	}

	@RequestMapping("/findeBillCode.do")
	public @ResponseBody int findBillCode(HttpServletRequest request) {
		String code = request.getParameter("code");

		int count = marketBill.findBillCode(code);

		return count;

	}

	/**
	 * @Description (执行修改业务并把bill存入session前端显示)
	 * @param bill
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatebill.do")
	public String updateBill(MarketBill bill, HttpServletRequest request,
			HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		int count = marketBill.updateBill(bill);
		System.err.println(bill.getBillcode());
		System.err.println(bill.getIspayment());
		System.err.println(bill.getProviderid());
		request.getSession().setAttribute("bill", bill);
		if (count == 1) {
			return "redirect:billlist.do";
		} else {
			return "billmodify";
		}
	}

	/**
	 * @Description (点击订单界面跳转到订单界面)
	 * @return
	 */
	@RequestMapping("/billlist.do")
	public String billlist(Model model, HttpSession session, MarketBill bill) {
		System.err.println(333);
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		List<MarketBill> marketProvider = marketBill.getMarketProvider();
		session.setAttribute("marList", marketProvider);
		System.out.println(marketProvider);
		return "billlist";
	}

	/**
	 * @Description (点击新增订单跳转到新增订单界面)
	 * @return
	 */
	@RequestMapping("/addbill.do")
	public String addbill(Model model, HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "billadd";
	}

	/**
	 * @Description (点击修改订单跳转到修改订单界面)
	 * @return
	 */
	@RequestMapping("/billmodify.do")
	public String updatebill(Integer idno, HttpServletRequest request,
			Model model, HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		MarketBill BillById = marketBill.selectBillById(idno);
		request.getSession().setAttribute("BillById", BillById);

		return "billmodify";
	}

}
