package kr.or.crud.Service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.crud.Service.IcrudService;
import kr.or.crud.mapper.crudMapper;
import kr.or.crud.vo.ServiceVO;
import kr.or.crud.vo.memberVO;
import kr.or.crud.vo.subscriptionVO;
import kr.or.crud.vo.usagestatusVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class crudServiceImpl implements IcrudService {
	
	@Autowired
	crudMapper mapper;

	@Override
	public int postUser(Map<String, String> map) {
		
		return this.mapper.postUser(map);
	}

	@Override
	public memberVO postId(Map<String, String> map) {
		
		return this.mapper.postId(map);
	}

	@Override
	public memberVO userInfo(String memId) {
		
		return this.mapper.userInfo(memId);
	}

	@Override
	@Transactional //하나라도 수정 및 등록이 안 될 경우 트랜잭션 처리
	public int serForm(Map<String, String> map) {
		
		//회원 정보 수정
		this.mapper.memberUpdate(map);
		
		//구독 등록
		this.mapper.subInsert(map);
		map.put("subId", map.get("subId"));
		
		//사용현황 등록
		return this.mapper.usaInsert(map);
	}

	@Override
	public subscriptionVO subSelect(String memId) {
		
		return this.mapper.subSelect(memId);
	}

	@Override
	public List<subscriptionVO> subSelectList(String memId) {
		return this.mapper.subSelectList(memId);
	}

	@Override
	public int subExtend(Map<String, String> map) {
		return this.mapper.subExtend(map);
	}

	@Override
	public ServiceVO serInfo(Map<String, String> map) {
		return this.mapper.serInfo(map);
	}

	
}
