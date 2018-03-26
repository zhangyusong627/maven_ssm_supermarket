package cn.bdqn.mapper;

import cn.bdqn.pojo.MarketProvider;
import cn.bdqn.util.PageBean;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

public interface MarketProviderMapper {
	
	/**
	 * 查询所有供应商
	 * @return
	 */
	List<MarketProvider> getAllProvider();
	
	/**
	 * 通过id查询供应商
	 * @return
	 */
	MarketProvider getProviderById(Integer idno);
	
	/**
	 * 添加供应商
	 * @param marketProvider
	 * @return
	 */
	Integer addProvider(@Param("marketProvider")MarketProvider marketProvider );
	
    /**
     * 通过id删除用户
     * @param idno
     * @return
     */
	Integer deleteProvider(@Param("idno")Integer idno );
	
	/**
	 * 通过id修改供应商
	 * @param idno
	 * @param marketProvider
	 * @return
	 */
	Integer updateProvider(MarketProvider marketProvider);
	
	/**
	 * 通过供应商编码和姓名模糊查询供应商
	 * @param marketProvider
	 * @return
	 */
	List<MarketProvider> getProviderByCodeWithName(MarketProvider marketProvider,@Param("procode")String procode,@Param("proname")String proname);
	
	
	/**
	 * 分页查询
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
//	PageInfo<MarketProvider> selectallList(int pageNum, int pageSize);

	
	/**
	 * 查询供应商是否存在
	 * @param procode
	 * @return
	 */
	Integer findCode(String procode);
	
   
}