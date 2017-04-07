package lcsw.mapper;

import java.util.List;

import lcsw.domain.Treatment;

public interface TreatmentMapper {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Treatment record);
    
    int insertByBatch(List<Treatment> record);

//    int insertSelective(Case record);

    Treatment selectByPrimaryKey(Integer id);
    
    List<Treatment> selectByCaseId(Integer id);

    int updateByPrimaryKey(Treatment record);
    
    int updateByBatch(List<Treatment> record);
	
}
