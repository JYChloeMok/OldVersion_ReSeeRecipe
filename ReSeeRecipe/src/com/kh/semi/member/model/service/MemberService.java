package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.member.model.vo.MemberUpdate;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		close(conn);
		
		return m;
	}
	
	public int selectMemlistCount() {
		
		Connection conn = getConnection();
		
		int memlistCount = new MemberDao().selectMemlistCount(conn);
		
		close(conn);
		
		return memlistCount;
	}
	
	
	
	
	public ArrayList<Member> selectMemberAll(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberAll(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Member selectMemInfo(int memNo){
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMemInfo(conn, memNo);
		
		close(conn);
		
		return m;
	}
	
	public int updateMemInfo(Member m, MemberUpdate mu) {
		
		Connection conn = getConnection();
		
		int result1 = new MemberDao().updateMemInfo(conn, m);
		//java.sql.Date memberModifyDate = java.sql.Date.valueOf(m.getModifyDate());
		int result2 = 1; //new MemberDao().updateMemInfo(conn, mu);
		Date sqlDate = new java.sql.Date(System.currentTimeMillis());
		if(m.getModifyDate() != null) {
		
		} else if(m.getModifyDate().before(sqlDate)) {
			System.out.print("적음");
		}
		
	}
}
