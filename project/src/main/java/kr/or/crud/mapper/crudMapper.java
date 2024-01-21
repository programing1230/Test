package kr.or.crud.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.crud.vo.ServiceVO;
import kr.or.crud.vo.memberVO;
import kr.or.crud.vo.subscriptionVO;
import kr.or.crud.vo.usagestatusVO;

@Mapper
public interface crudMapper {

	public int postUser(Map<String, String> map);

	public memberVO login(String id);

	public memberVO postId(Map<String, String> map);

	public memberVO userInfo(String memId);

	public int subInsert(Map<String, String> map);

	public int memberUpdate(Map<String, String> map);

	public int usaInsert(Map<String, String> map);
	
	public subscriptionVO subSelect(String memId);

	public List<subscriptionVO> subSelectList(String memId);

	public int subExtend(Map<String, String> map);

	public ServiceVO serInfo(Map<String, String> map);
	

}
