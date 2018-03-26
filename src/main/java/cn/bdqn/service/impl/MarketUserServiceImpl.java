package cn.bdqn.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bdqn.mapper.MarketUserMapper;
import cn.bdqn.pojo.MarketUser;
import cn.bdqn.service.MarketUserService;
@Service
public class MarketUserServiceImpl implements MarketUserService {
	@Autowired
	private MarketUserMapper marketUserMapper;

	@Override
	public MarketUser getAllMarketUser(MarketUser marketUser) throws Exception {
		// TODO Auto-generated method stub
		return marketUserMapper.getAllMarketUser(marketUser);
		
	}

	@Override
	public List<MarketUser> selectUser(String username, Integer roleid) throws Exception {
		
		return marketUserMapper.selectUser(username, roleid);
	}

	@Override
	public MarketUser getUserById(Integer idno) throws Exception {
		// TODO Auto-generated method stub
		return marketUserMapper.getUserById(idno);
	}

	@Override
	public int updateUser(MarketUser marketUser) throws Exception {
		// TODO Auto-generated method stub
		return marketUserMapper.updateUser(marketUser);
	}

	@Override
	public int addUser(MarketUser marketUser) throws Exception  {
		// TODO Auto-generated method stub
		return marketUserMapper.addUser(marketUser);
	}

	@Override
	public int deleteUserById(Integer idno) throws Exception  {
		
		return marketUserMapper.deleteUserById(idno);
	}

	@Override
	public int findUserCode(String usercode) {
		// TODO Auto-generated method stub
		return marketUserMapper.findUserCode(usercode) ;
	}

	@Override
	public int updateUserpassword(MarketUser marketUser) throws Exception {
		
		return marketUserMapper.updateUserpassword(marketUser);
	}
	@Override
	public PageInfo<MarketUser> getAllUserPage(MarketUser marketUser,
			Integer startPage, Integer pageSize,String username, Integer roleid) throws Exception {
		PageHelper.startPage(startPage, pageSize);
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		List<MarketUser> list = marketUserMapper.selectUser(username, roleid);
		for (MarketUser marketUser2 : list) {
			cal.setTime(date);
			int nowYear = cal.get(cal.YEAR);
			cal.setTime(marketUser2.getBirthday());
			int year = cal.get(cal.YEAR);
			marketUser2.setAge(nowYear-year);
			System.err.println(marketUser2);
		}
	    PageInfo<MarketUser> info = new PageInfo<MarketUser>(list,5);
	        return info;
	}

	

	
	
	
	
}
