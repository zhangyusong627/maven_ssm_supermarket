package cn.bdqn.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bdqn.mapper.MarketBillMapper;
import cn.bdqn.mapper.MarketProviderMapper;

import cn.bdqn.pojo.MarketBill;
import cn.bdqn.pojo.MarketProvider;
import cn.bdqn.pojo.Page;
import cn.bdqn.service.MarketBillService;


/**
 * @ClassName Text
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author 向恒山
 * @Date 创建时间 2017年9月22日上午8:46:40
 * @version 1.0.0
 **/

@Service
public class MarketBillServiceImpl implements MarketBillService {

    @Autowired
    private MarketBillMapper billMapper;
    @Autowired
    private MarketProviderMapper providerMapper;
    
 

  

    @Override
    public int addBill(MarketBill bill) {
        
        return billMapper.addBill(bill);
    }

    @Override
    public int deleteBillById(Integer idno) {
        return billMapper.deleteBillById(idno);
    }

    @Override
    public MarketBill selectBillById(Integer idno) {
        return billMapper.selectBillById(idno);
    }

    @Override
    public int updateBill(MarketBill bill) {
        
        return  billMapper.updateBill(bill);
    }

    @Override
    public List<MarketBill> getMarketBillByParements(String productname,Integer providerid,Integer ispayment) {
       
        return billMapper.getMarketBillByParements(productname,providerid,ispayment);
    }

    @Override
    public List<MarketBill> getMarketProvider() {
       
        return billMapper.getMarketProvider();
    }

    @Override
    public int findBillCode(String billcode) {
        
        return billMapper.findBillCode(billcode);
    }

   

    @Override
    public PageInfo<MarketBill> getAllBillPage(MarketBill bill,String productname,Integer providerid,Integer ispayment,Integer startPage, Integer pageSize) {
       PageHelper.startPage(startPage,pageSize);

       List<MarketBill> parements = billMapper.getMarketBillByParements(productname, providerid, ispayment);
      for (MarketBill marketBill : parements) {
        System.err.println(parements);
    }
       
       PageInfo<MarketBill> info = new PageInfo<MarketBill>(parements,5);
        return info;
    }
    
    
    

}
