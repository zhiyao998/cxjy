package lcsw.service;

import java.util.List;

import lcsw.domain.Inquiry;

public interface InquiryService {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Inquiry record);

//    int insertSelective(Case record);

    Inquiry selectByPrimaryKey(Integer id);
    
    List<Inquiry> selectByCaseId(Integer id);
    
    List<Inquiry> selectByType(Integer tpye);

    int updateByPrimaryKey(Inquiry record);
	
}
