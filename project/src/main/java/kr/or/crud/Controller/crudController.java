package kr.or.crud.Controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.crud.Service.IcrudService;
import kr.or.crud.vo.ServiceVO;
import kr.or.crud.vo.memberVO;
import kr.or.crud.vo.subscriptionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("")
@Slf4j
public class crudController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	IcrudService service;
	
	//회원가입 페이지
	@GetMapping("/userform")
	public String userform() {
		
		return "/userform";
		
	}

	//회원가입
	@ResponseBody
	@PostMapping("/post/user")
	public int postUser(@RequestBody Map<String, String> map) {
		
		String pass=passwordEncoder.encode(map.get("pass")); //암호화
		
		map.put("pass", pass);
		
		return this.service.postUser(map);
		
	}
	
	//회원가입 중복 아이디 확인
	@ResponseBody
	@PostMapping("/post/id")
	public memberVO postId(@RequestBody Map<String, String> map) {
		
		return this.service.postId(map);
	}
	
	//로그인페이지
	@GetMapping("/login")
	public String login(Model model, String id, String pass) {
		
		return "/login";
		
	}
	
	//로그인 전 메인페이지
	@GetMapping("/main")
	public String main() {
		
		return "/main";
	}
	
	//사용현황 페이지
	@GetMapping("/member/subscribe")
	public String subscribe(Principal principal, Model model) {

		String memId=principal.getName();
		
		model.addAttribute("memId",memId);
		
		//여태한 구독 정보 가져오기
		List<subscriptionVO> list=this.service.subSelectList(memId);
		
		model.addAttribute("list",list);
		
		return "/member/subscribe";
	}
	
	//구독신청페이지
	@GetMapping("/member/subform")
	public String subform() {

		return "/member/subform";
	}
	
	//구독 신청 및 회원정보수정
	@ResponseBody
	@PostMapping("/post/serForm")
	public int serForm(@RequestBody Map<String, String> map, Principal principal) {
		String memId=principal.getName();
		
		map.put("memId", memId);
		
		//잔여기간이 남았을 경우 구독을 못하게 하기 위해 처리
		subscriptionVO subVO=this.service.subSelect(memId);
		
		//기간이 1이상 남은 사람이면 구독 신청이 안 되도록
		int result=0;
		if(subVO==null || subVO.getPeriod()<=0) {
		    result=this.service.serForm(map);
		} else {
			result=0;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/post/subExtend")
	public int subExtend(@RequestBody Map<String, String> map, Principal principal){
		
		String memId=principal.getName();
		
		//서비스 정보 가져오기
		ServiceVO serviceVO=this.service.serInfo(map);
		
		String period=String.valueOf(serviceVO.getSerPeriod());
		
		map.put("SerPeriod",period);
		map.put("memId", memId);
		
		return this.service.subExtend(map);
	}
	
}
