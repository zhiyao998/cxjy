package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Inquiry;
import lcsw.mapper.InquiryMapper;
import lcsw.service.InquiryService;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Resource
	private InquiryMapper InquiryMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return InquiryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(Integer id) {
		return InquiryMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(Inquiry record) {
		return InquiryMapper.insert(record);
	}

	@Override
	public Inquiry selectByPrimaryKey(Integer id) {
		return InquiryMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Inquiry> selectByCaseId(Integer id) {
		return InquiryMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(Inquiry record) {
		return InquiryMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Inquiry> selectByType(Integer type) {
		return InquiryMapper.selectByType(type);
	}

}
