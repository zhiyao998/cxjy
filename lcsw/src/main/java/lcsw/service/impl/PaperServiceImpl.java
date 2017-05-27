package lcsw.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Paper;
import lcsw.mapper.PaperMapper;
import lcsw.service.PaperService;

@Service
public class PaperServiceImpl implements PaperService {
	
	@Resource
	private PaperMapper paperMapper;

	@Override
	public int insert(Paper paper) {
		return paperMapper.insert(paper);
	}

}
