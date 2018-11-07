package cn.bdqn.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.bdqn.pojo.MarketUser;

public class MarketUserServiceImplTest {

	private MarketUserServiceImpl userServiceImpl;

	@Before
	public void setUp() throws Exception {
		ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		userServiceImpl = cxt.getBean(MarketUserServiceImpl.class);
	}

	@Test
	public void testSelectUser() throws Exception {
		List<MarketUser> selectUser = userServiceImpl.selectUser(null, null);
		for (MarketUser marketUser : selectUser) {
			System.err.println(marketUser);
		}
	}

}
