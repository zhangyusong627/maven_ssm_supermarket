package cn.bdqn.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.swing.text.DateFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bdqn.mapper.MarketProviderMapper;
import cn.bdqn.pojo.MarketProvider;
import cn.bdqn.service.MarketProviderService;
import cn.bdqn.util.PageBean;


@Service
public class MarketProviderServiceImpl implements MarketProviderService {
	
	@Autowired
	private MarketProviderMapper marketProviderMapper;

	@Override
	public List<MarketProvider> getAllProvider() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<MarketProvider> allProvider = marketProviderMapper.getAllProvider();
		for (MarketProvider marketProvider : allProvider) {
			String format = sdf.format(marketProvider.getCreationdate());
			marketProvider.setCreatedate(format);
			System.out.println(marketProvider);
		}
		return allProvider;
	}

	@Override
	public Integer addProvider(MarketProvider marketprovider) {
		// TODO Auto-generated method stub
		return marketProviderMapper.addProvider(marketprovider);
	}

	@Override
	public Integer deleteProvider(Integer idno) {
		// TODO Auto-generated method stub
		return marketProviderMapper.deleteProvider(idno);
	}

	@Override
	public Integer updateProvider(MarketProvider marketProvider) {
		// TODO Auto-generated method stub
		return marketProviderMapper.updateProvider(marketProvider);
	}

	@Override
	public MarketProvider getProviderById(Integer idno) {
		// TODO Auto-generated method stub
		return marketProviderMapper.getProviderById(idno);
	}

	@Override
	public List<MarketProvider> getProviderByCodeWithName(
			MarketProvider marketProvider,String procode,String proname) {
		// TODO Auto-generated method stub
		return marketProviderMapper.getProviderByCodeWithName(marketProvider, procode, proname);
	}

	
//	/**
//	 * 分页查询
//	 * @param pageNum
//	 * @param pageSize
//	 * @return
//	 */
//	@Override
//	public PageInfo<MarketProvider> selectallList(
//			int pageNum, int pageSize) {
//				return null;
//		
//		PageHelper.startPage(pageNum, pageSize);
//		List<MarketProvider> allProvider = marketProviderMapper.getAllProvider();
//		PageInfo<MarketProvider> pageBean = new PageInfo<MarketProvider>(allProvider);
//		return pageBean;
//	}

	@Override
	public Integer findCode(String procode) {
		// TODO Auto-generated method stub
		return marketProviderMapper.findCode(procode);
	}

	@Override
	public PageInfo<MarketProvider> getAllProviderPage(
			MarketProvider marketProvider, Integer startPage, Integer pageSize,String procode,String proname
			) {
		PageHelper.startPage(startPage, pageSize);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<MarketProvider> providerByCodeWithName = marketProviderMapper.getProviderByCodeWithName(marketProvider, procode, proname);
		for (MarketProvider m : providerByCodeWithName) {
			String format = sdf.format(m.getCreationdate());
			m.setCreatedate(format);
			System.out.println(m);
		}
		PageInfo<MarketProvider> info = new PageInfo<MarketProvider>(providerByCodeWithName,3);
		return info;
	}


	





}
