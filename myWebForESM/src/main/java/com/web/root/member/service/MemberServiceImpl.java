package com.web.root.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	
	// 로그인Form에서 정보 받아와서 Login 하기
	@Override
	public void memberLogin(Model model, HttpServletRequest request, HttpSession session) {
		
		// 정보 받기
		String id = request.getParameter("loginId");
		String pwd = request.getParameter("loginPassword");
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPwd(pwd);
		
		// id 존재 유무 확인
		int existaceOfUser = memberMapper.existaceOfUser(member);
		
		if( existaceOfUser == 1) { // 존재시 로그인
			MemberDTO loginMember = memberMapper.getUser(member);
			
			model.addAttribute("user", loginMember);
			session.setAttribute("user", loginMember);
			
		} else { // 비존재시 로그인 실패로 보내자
			
		}
		
	}


	// 회원가입
	@Override
	public int signIn(HttpServletRequest request) {
		
		// 정보 받기
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("userId"));
		memberDTO.setPwd(request.getParameter("userPwd"));
		memberDTO.setNickname(request.getParameter("userNickName"));
		memberDTO.setPhone(request.getParameter("userPhone"));
		memberDTO.setEmail(request.getParameter("userEmail"));
		memberDTO.setAddr(request.getParameter("userAddr"));
		
		return memberMapper.signIn(memberDTO);
	}

	// 회원 정보 수정
	@Override
	public int memberModify(Model model, HttpServletRequest request, HttpSession session) {
		
		// 정보 받기
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("userId"));
		memberDTO.setPwd(request.getParameter("userPwd"));
		memberDTO.setNickname(request.getParameter("userNickName"));
		memberDTO.setPhone(request.getParameter("userPhone"));
		memberDTO.setEmail(request.getParameter("userEmail"));
		memberDTO.setAddr(request.getParameter("userAddr"));
		
		// 성공 유무 확인
		int success = memberMapper.memberModify(memberDTO);
		if(success == 1) {
			session.setAttribute("user", memberMapper.getUser(memberDTO));
		}
		
		
		// success 돌려줄 필요없을듯...? (성공, 실패 맨트를 차후 추가하자)
		return success;
	}

	// 회원 정보 삭제// 회원 정보 삭제
	@Override
	public int memberDelete(MemberDTO memberDTO) {
		
		int success = memberMapper.memberDelete(memberDTO);
		
		// success 돌려줄 필요없을듯...? (성공, 실패 맨트를 차후 추가하자)
		return success;
	}


	// 카카오 로그인 - code를 보내 access_Token 얻기
	@Override
	public String getAccessToken(String authorize_code) throws Throwable {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			// Q1. URL 클래스: What, How, Purpose ??
			URL url = new URL(reqURL);
			
			// Q2. HttpURLConnection ??
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())); // Q3. 파일 전송형식 비슷?
			
			// Q4. StringBuilder 란?
			// A4. header 작성하는데 쓰이는 것이 아닐까요? 그 script에서 htm += <b> 내용 </b> ... 하는것처럼?
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			
			sb.append("&client_id=dcac716d192c1c3d2508c1adc0dc6836"); // REST_ API 키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri =http://localhost:8080/root/member/kakaoLoginTest"); // REDIRECT_URI 본인이 설정한 주소 넣어주기
			
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			// 요청을 통해 얻은 JSON 타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader ( new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body: " + result);
			
			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			
			// JSON String -> MAP
			// Q5. TypeReference 란?
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
			
			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();
			
			// 토큰값 확인
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			
			// BufferedReader, BufferedWriter 종료
			br.close();
			bw.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}


	// 카카오 로그인 3번 - 받은 access_Token 을 보내 userInfo 얻기
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap 타입으로 선언
		// Q6. 위 설명을 이해 못하겠다.
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type " + result.getClass().getName()); // java.lang.String
			
			try {
				// jackson objectmapper 객체 생성
				
				// JSON String -> Map
				
				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));
				// 계속 써야함
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
