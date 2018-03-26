package cn.bdqn.service;

import java.util.List;

import com.github.pagehelper.PageInfo;


import cn.bdqn.pojo.MarketBill;
import cn.bdqn.pojo.Page;

/**
 * @ClassName Text
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author 向恒山
 * @Date 创建时间 2017年9月22日上午8:43:11
 * @version 1.0.0
 **/
public interface MarketBillService {

    

    
    
    int addBill(MarketBill bill);
    
    int deleteBillById(Integer idno);
    
    MarketBill selectBillById(Integer idno);
    

    int updateBill(MarketBill bill);
    
    
    List<MarketBill> getMarketProvider();
    
    int findBillCode(String billcode);
    
    List<MarketBill> getMarketBillByParements(String productname,Integer providerid,Integer ispayment);
    
    PageInfo<MarketBill> getAllBillPage(MarketBill bill,String productname,Integer providerid,Integer ispayment,Integer startPage, Integer pageSize);

}
