package lcsw.mapper;

import java.util.List;

import lcsw.domain.Inquiry;

public interface InquiryMapper {

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(Integer id);

    int insert(Inquiry record);

//    int insertSelective(Case record);

    Inquiry selectByPrimaryKey(Integer id);
    
    List<Inquiry> selectByCaseId(Integer id);

    int updateByPrimaryKey(Inquiry record);
	
}
