package kr.or.crud.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.or.crud.mapper.crudMapper;
import kr.or.crud.vo.memberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDetailsService implements UserDetailsService {
	
    @Autowired
    private crudMapper crudMapper;
	
//	@Autowired
//	BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
        log.info("username : {}", username);
        memberVO memVO = new memberVO();
        memVO.setMemId(username);
		
        memVO = crudMapper.login(username);
        
        log.info("memVO : {}", memVO);
        
        return memVO == null ? null : new AuthUser(memVO);
    }

}