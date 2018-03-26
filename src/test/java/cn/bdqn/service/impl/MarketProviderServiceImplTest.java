package cn.bdqn.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.bdqn.pojo.MarketProvider;
import cn.bdqn.service.MarketProviderService;
import cn.bdqn.util.PageBean;


@Service
public class MarketProviderServiceImplTest {

	@Autowired
	private MarketProviderServiceImpl marketProviderService;

	@Before
	public void setUp() throws Exception {
		ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		marketProviderService = cxt.getBean(MarketProviderServiceImpl.class);
	}

	@Test
	public void testGetAllProvider() {
		List<MarketProvider> allProvider = marketProviderService.getAllProvider();
		for (MarketProvider marketProvider : allProvider) {
			System.err.println(marketProvider);
		}
	}
	
	@Test
	public void testAddProvider() {
		MarketProvider marketProvider = new MarketProvider();
		
		marketProvider.setProcode("HB-HBS001");
		marketProvider.setProname("九州通");
		marketProvider.setProdesc("长期合作：主营药品");
		marketProvider.setProcontact("吴舟");
		marketProvider.setProphone("18607290541");
		marketProvider.setProaddress("湖北省应城市");
		marketProvider.setProfax("0712-2222222");

		Integer addProvider = marketProviderService.addProvider(marketProvider);
		System.err.println(addProvider);
	}
	
	@Test
	public void testDeleteProvider() {
		
		Integer idno =30;
		Integer deleteProvider = marketProviderService.deleteProvider(idno);
		System.err.println(deleteProvider);
	}
	
	@Test
	public void testUpdateProvider() {
		MarketProvider marketProvider = new MarketProvider();
		marketProvider.setProcode("123142");
		marketProvider.setProname("神马117777");
		marketProvider.setProcontact("吴晗");
		marketProvider.setProaddress("三合");
		marketProvider.setProphone("1111111111");
		marketProvider.setProfax("14132131");
		marketProvider.setProdesc("浮云");
		marketProvider.setIdno(96);
		Integer updateProvider = marketProviderService.updateProvider(marketProvider);
		System.err.println(updateProvider);
	}
	
//	
//	@Test
//	public void testGetProviderByCodeWithName() {
//		MarketProvider marketProvider = new MarketProvider();
//
//		marketProvider.setProcode("GZ_");
//		List<MarketProvider> providerByCodeWithName = marketProviderService.getProviderByCodeWithName(marketProvider);
//		for (MarketProvider marketProvider2 : providerByCodeWithName) {
//			System.err.println(marketProvider2);
//		}
//	}
	
	@Test
	public void testGetAllProviderPage() {
		
	}
	
	

}
