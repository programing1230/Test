package kr.or.crud.vo;

import java.util.List;

import lombok.Data;

@Data
public class memberVO {
	
	private String memId ;
	private String name  ;
	private String birth  ;
	private String tel  ;
	private String id    ;
	private String pass   ;
	
    private List<AuthrtVO> authList;
}
