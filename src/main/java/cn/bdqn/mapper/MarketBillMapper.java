package cn.bdqn.mapper;

import java.util.List;




import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;


import cn.bdqn.pojo.MarketBill;
import cn.bdqn.pojo.Page;

public interface MarketBillMapper {

    List<MarketBill> getAllMarketBill();

    int getCountByPage(Page<MarketBill> page);

   
    
    int addBill(MarketBill bill);
    
    int deleteBillById(Integer idno);
    
    MarketBill selectBillById(Integer idno);
    
    int updateBill(MarketBill bill);
    
    List<MarketBill> getMarketProvider();
    
    
    int findBillCode(String billcode);

    List<MarketBill> getMarketBillByParements(@Param("productname")String productname,@Param("providerid")Integer providerid,@Param("ispayment")Integer ispayment);

   
    
}
