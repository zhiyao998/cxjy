package lcsw.mapper;

import java.util.List;

import lcsw.domain.Diagnose;

public interface DiagnoseMapper {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(Integer id);

    int insert(Diagnose record);

//    int insertSelective(Case record);

    Diagnose selectByPrimaryKey(Integer id);
    
    List<Diagnose> selectByCaseId(Integer id);

    int updateByPrimaryKey(Diagnose record);
	
}
