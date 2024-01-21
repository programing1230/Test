package kr.or.crud.Service;

import java.util.List;
import java.util.Map;

import kr.or.crud.vo.ServiceVO;
import kr.or.crud.vo.memberVO;
import kr.or.crud.vo.subscriptionVO;
import kr.or.crud.vo.usagestatusVO;

public interface IcrudService {

	public int postUser(Map<String, String> map);

	public memberVO postId(Map<String, String> map);

	public memberVO userInfo(String memId);

	public int serForm(Map<String, String> map);

	public subscriptionVO subSelect(String memId);

	public List<subscriptionVO> subSelectList(String memId);

	public int subExtend(Map<String, String> map);

	public ServiceVO serInfo(Map<String, String> map);


}
