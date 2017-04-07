package lcsw.mapper;

import java.util.List;

import lcsw.domain.Inquiry;

public interface InquiryMapper {

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Inquiry record);
    
    int insertByBatch(List<Inquiry> record);

//    int insertSelective(Case record);

    Inquiry selectByPrimaryKey(Integer id);
    
    List<Inquiry> selectByCaseId(Integer id);

    List<Inquiry> selectByType(Integer type);
    
    int updateByPrimaryKey(Inquiry record);
    
    int updateByBatch(List<Inquiry> record);
	
}
