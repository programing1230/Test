package kr.or.crud.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.crud.vo.memberVO;

public class AuthUser extends User {
    
    private static final long serialVersionUID = 1L;
    
    private memberVO memVO;
    
    public AuthUser(String username, String password,
                    Collection<? extends GrantedAuthority> authorities) {
                    
        super(username, password, authorities);
    }
    
    public AuthUser(memberVO memVO) {
        
        super(memVO.getMemId(), memVO.getPass(), 
            memVO.getAuthList().stream()
                 .map(auth -> new SimpleGrantedAuthority(auth.getAuthrt()))
                 .collect(Collectors.toList()));
		
        this.memVO = memVO;
    }
    
    
    public memberVO getMemVO() {
        return memVO;
    }
    public void setMemVO(memberVO memVO) {
        this.memVO = memVO;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}