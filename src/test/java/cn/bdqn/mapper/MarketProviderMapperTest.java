package cn.bdqn.mapper;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import cn.bdqn.pojo.MarketProvider;

@Service
public class MarketProviderMapperTest {

	@Autowired
	private MarketProviderMapper marketProviderMapper;

	@Before
	public void setUp() throws Exception {
	  ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	  marketProviderMapper = cxt.getBean(MarketProviderMapper.class);
	}

	@Test
	public void testGetAllProvider() {
		List<MarketProvider> allProvider = marketProviderMapper.getAllProvider();
		for (MarketProvider marketProvider : allProvider) {
			System.err.println(marketProvider);
		}
		
	}
	
	
	@Test
	public void testGetProviderById() {
		Integer idno =1;
		MarketProvider providerById = marketProviderMapper.getProviderById(idno);
		System.out.println(providerById);
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

		Integer addProvider = marketProviderMapper.addProvider(marketProvider);
		System.err.println(addProvider);

		
	}
	
	@Test
	public void testDeleteProvider() {
		
		Integer idno =17;
		Integer deleteProvider = marketProviderMapper.deleteProvider(idno);
		System.err.println(deleteProvider);
	}
	
	@Test
	public void testUpdateProvider() {
		MarketProvider marketProvider = new MarketProvider();
		marketProvider.setProcode("123145");
		marketProvider.setProname("神马11");
		marketProvider.setProcontact("吴晗");
		marketProvider.setProaddress("三合");
		marketProvider.setProphone("22222222222");
		marketProvider.setProfax("141321311");
		marketProvider.setProdesc("浮云");
		marketProvider.setIdno(96);
		Integer updateProvider = marketProviderMapper.updateProvider(marketProvider);
		System.err.println(updateProvider);

	}
	
//	@Test
//	public void testGetProviderByCodeWithName() {
//		
//		MarketProvider marketProvider = new MarketProvider();
//	marketProvider.setProcode("BJ_");
//		
//		marketProvider.setProname("北京三木堂商贸有限公司");
//		List<MarketProvider> providerByCode = marketProviderMapper.getProviderByCodeWithName(marketProvider);
//		for (MarketProvider marketProvider2 : providerByCode) {
//			System.err.println(marketProvider2);
//		}
//
//
//	}
	
	@Test
	public void testFindCode() {
		Integer count = marketProviderMapper.findCode("9999");
		System.err.println(count);


	}

}
