package com.spring.wefit.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.course.mapper.ICourseBoardMapper;

@Service
public class CourseBoardService implements ICourseBoardService {
   
   @Autowired
   private ICourseBoardMapper mapper;

   @Override
   public void regist(CourseBoardVO vo) {      
      mapper.regist(vo);      
   }

   @Override
   public List<CourseBoardVO> getList() {
      List<CourseBoardVO> list = mapper.getList();
      return list;
   }

   @Override
   public int getTotal() {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public CourseBoardVO getContent(int cbNum) {
      return mapper.getContent(cbNum);
   }

   @Override
   public void update(CourseBoardVO vo) {
      mapper.update(vo);   
   }

   @Override
   public void delete(int cbNum) {
      mapper.delete(cbNum);      
   }

   @Override
   public void upHit(int cbNum) {
      mapper.upHit(cbNum);
   }

   @Override
   public void upLike(int cbNum) {
//      mapper.upLike(cbNum);
   }
   
   
}