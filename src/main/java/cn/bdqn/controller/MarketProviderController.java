package cn.bdqn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.bdqn.pojo.MarketProvider;
import cn.bdqn.service.MarketProviderService;
import cn.bdqn.util.Constants;

@Controller
public class MarketProviderController {

	@Autowired
	private MarketProviderService marketProviderService;

	/**
	 * 接收请求跳转页面
	 * 
	 * @return
	 */
	@RequestMapping("/getAllProvider1.do")
	public String rter(HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "providerlist";

	}

	// /**
	// * 查询所有供应商
	// * @return
	// */
	// @RequestMapping("/getAllProvider.do")
	// public ModelAndView getAllProvider(ModelAndView model){
	//
	// List<MarketProvider> lists = marketProviderService.getAllProvider();
	//
	// model.addObject("Providerlist", lists);
	// model.setViewName("ELproviderlist");
	// return model;
	// }

	// /**
	// * 查询所有供应商
	// * @return
	// */
	// @RequestMapping("/getAllProvider.do")
	// public String getAllProvider(Model model){
	//
	// List<MarketProvider> lists = marketProviderService.getAllProvider();
	//
	// model.addAttribute("Providerlist", lists);
	// return "providerlist";
	// }
	//

	@RequestMapping("/getAllProvider.do")
	public @ResponseBody PageInfo<MarketProvider> getAllProvider(
			MarketProvider marketProvider, Integer startPage, Integer pageSize,
			String procode, String proname) {
		return marketProviderService.getAllProviderPage(marketProvider,
				startPage, pageSize, procode, proname);
	}

	/**
	 * 通过id查询供应商
	 * 
	 * @return
	 */
	@RequestMapping("/getProviderById.do")
	public String getProviderById(Integer idno, HttpServletRequest request) {
		MarketProvider provider = marketProviderService.getProviderById(idno);
		HttpSession session = request.getSession();
		session.setAttribute("provider", provider);
		return "providerview";
	}

	/**
	 * 添加供应商
	 * 
	 * @return
	 */
	@RequestMapping("/addProvider.do")
	public String addProvider(MarketProvider marketProvider, HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		return "provideradd";

	}

	/**
	 * 添加供应商
	 * 
	 * @return
	 */
	@RequestMapping("/addProvider1.do")
	public @ResponseBody Integer addProvider1(MarketProvider marketProvider) {
		Integer count = marketProviderService.addProvider(marketProvider);

		System.err.println(count);

		return count;

	}

	/**
	 * 通过id删除供应商
	 * 
	 * @return
	 */
	@RequestMapping("/deleteProvider.do")
	public @ResponseBody Integer deleteProvider(Integer idno) {
		Integer count = marketProviderService.deleteProvider(idno);
		// if(count==1){
		// return "redirect:getAllProvider.do";
		// }
		// return "providerlist";
		return count;

	}

	/**
	 * 通过id把供应商信息传到修改界面
	 * 
	 * @return
	 */
	@RequestMapping("/updateProvider.do")
	public String updateProvider(Integer idno, HttpServletRequest request,
			HttpSession session) {
		// ：进入页面之前，判断当前用户是否登录
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:login.do";
		}
		MarketProvider providerById = marketProviderService
				.getProviderById(idno);
		session.setAttribute("providerById", providerById);
		return "providermodify";

	}

	/**
	 * 修改供应商信息
	 * 
	 * @return
	 */
	@RequestMapping("/updateProvider1.do")
	public @ResponseBody Integer updateProvider1(MarketProvider marketProvider) {

		Integer count = marketProviderService.updateProvider(marketProvider);
		System.err.println(count);
		return count;

	}

	// /**
	// * 分页查询
	// * @param pageNum
	// * @param pageSize
	// * @return
	// */
	// @RequestMapping("/pageProvider.do")
	// public @ResponseBody PageInfo<MarketProvider> pageProvider(int pageNum,
	// int pageSize){
	//
	// PageInfo<MarketProvider> pageInfo =
	// marketProviderService.selectallList(pageNum, pageSize);
	// return pageInfo;
	//
	// }

	// /**
	// * 通过供应商编码和姓名模糊查询供应商
	// * @return
	// */
	// @RequestMapping("/getProviderByCodeWithName.do")
	// public ModelAndView getProviderByCodeWithName(MarketProvider
	// marketProvider){
	//
	// List<MarketProvider> providerByCodeWithName =
	// marketProviderService.getProviderByCodeWithName(marketProvider);
	// ModelAndView modelAndView = new ModelAndView();
	// modelAndView.addObject("Providerlist",providerByCodeWithName);
	// modelAndView.setViewName("ELproviderlist");
	// return modelAndView;
	//
	// }
	//

	// /**
	// * 通过供应商编码和姓名模糊查询供应商
	// * @return
	// */
	// @RequestMapping("/getProviderByCodeWithName.do")
	// public String getProviderByCodeWithName(MarketProvider
	// marketProvider,String procode,String proname,Model model){
	//
	// List<MarketProvider> providerByCodeWithName =
	// marketProviderService.getProviderByCodeWithName(marketProvider, procode,
	// proname);
	// model.addAttribute("Providerlist", providerByCodeWithName);
	// return "providerlist";
	//
	// }

	/**
	 * 查询供应商编码是否存在
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findCode.do")
	public @ResponseBody Integer findCode(HttpServletRequest request) {
		String procode = request.getParameter("procode");
		Integer count = marketProviderService.findCode(procode);
		return count;

	}

}