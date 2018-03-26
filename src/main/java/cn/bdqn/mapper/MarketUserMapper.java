package cn.bdqn.mapper;

import cn.bdqn.pojo.MarketUser;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MarketUserMapper {
	 /**
	 * 登录验证
	 */
    MarketUser getAllMarketUser(MarketUser marketUser) throws Exception ;
	/**
	 * 查询全体用户信息
	 * @param pageSize 
	 * @param pageNum 
	 */
	List<MarketUser> selectUser(@Param("username")String username, @Param("roleid")Integer roleid) throws Exception;
	/**
	 * 根据编号查询用户信息
	 */
	MarketUser getUserById(Integer idno) throws Exception;
	/**
	 * 修改用户信息
	 */
	int updateUser(MarketUser marketUser) throws Exception;
	/**
	 * 增加用户信息
	 * @return 
	 */
	int addUser(MarketUser marketUser) throws Exception;
	/**
	 * 删除用户信息
	 * @return 
	 */
	int deleteUserById(Integer idno) throws Exception;
	
	/**
	 * 查询用户编码（是否重复）
	 * @return 
	 */
	
	int findUserCode(String usercode);
	/**
	 * 修改用户密码
	 * @return 
	 */
	int updateUserpassword(MarketUser marketUser)throws Exception;
}