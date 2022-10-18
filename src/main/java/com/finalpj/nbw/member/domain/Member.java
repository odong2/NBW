package com.finalpj.nbw.member.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements UserDetails {
    private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_gender;
    private String mem_birthday;
    private String mem_phone;
    private String mem_zipcode;
    private String mem_address;
    private String mem_address2;
    private String g_grade;
    private String mem_cdate;
    private String mem_update;
    private String mem_tprice;
    private String mem_email;

    @Builder
    public Member(String mem_id, String mem_pw, String mem_name, String mem_gender, String mem_birthday, String mem_phone
            , String mem_zipcode, String mem_address, String mem_address2, String mem_cdate, String mem_email,String g_grade){
        this.mem_id = mem_id;
        this.mem_pw = mem_pw;
        this.mem_name = mem_name;
        this.mem_gender = mem_gender;
        this.mem_birthday = mem_birthday;
        this.mem_phone = mem_phone;
        this.mem_zipcode = mem_zipcode;
        this.mem_address = mem_address;
        this.mem_address2 = mem_address2;
        this.mem_cdate = mem_cdate;
        this.mem_email = mem_email;
        this.g_grade = g_grade;
    }
    
	// 해당 User의 권한을 리턴하는곳
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(()->{
			return g_grade;
		});
		return collect;
	}

	// 해당 User의 Password를 리턴하는곳
	@Override
	public String getPassword() {
		return mem_pw;
	}

	// 해당 User의 Username을 리턴하는곳
	@Override
	public String getUsername() {
		return mem_id;
	}

	// 계정의 만료 여부
	@Override
	public boolean isAccountNonExpired() {
		return true; // 아니요
	}

	// 계정이 잠겨있는지 여부
	@Override
	public boolean isAccountNonLocked() {
		return true; // 아니요
	}

	// 비밀번호가 오래됐는지 여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true; // 아니요
	}

	// 계정이 비활성화 되어있나
	@Override
	public boolean isEnabled() {
		// 비활성화를 걸려면?
		// 현재시간 - 로긴시간 => 1년초과시 return false;
		return true; // 아니요
	}
}
