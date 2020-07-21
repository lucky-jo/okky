package com.ncs.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	MailService mailService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public MemberVO read(String userid) {
		return memberMapper.read(userid);
	}

	@Transactional
	@Override
	public int register(MemberVO memberVO) throws MessagingException, UnsupportedEncodingException {

//        AuthKeyDTO authKeyDTO = new AuthKeyDTO();
//        TempKey tempKey = new TempKey();
//        String authKey = tempKey.getKey(50, true);
//        authKeyDTO.setAuthkey(authKey);
//        authKeyDTO.setUserid(memberVO.getUserid());
//        memberMapper.addAuthKey(authKeyDTO);
//    	String body = "<h2>Okky 커뮤니티에 가입하신걸 환영 합니다!</h2><br><br>"
//    			+ "<h3>" + memberVO.getUserid() + "님</h3><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
//    			+ "<a href='http://localhost:8080/member/authKey?userid="+ memberVO.getUserid() +"&authkey="+authKey+"'>인증하기</a></p>";
//        mailService.authSendMail(memberVO.getEmail(), "Okky 커뮤니티에 가입하신걸 환영 합니다.", body);
		memberMapper.register(memberVO);
		return memberMapper.auth(memberVO.getUserid());
	}

	@Override
	public MemberVO get(String userid) {
		return memberMapper.get(userid);
	}

	@Override
	public int edit(MemberVO memberVO) {
		return memberMapper.edit(memberVO);
	}

	@Override
	public int passwordChange(MemberVO memberVO) {
		return memberMapper.passwordChange(memberVO);
	}

	@Override
	public List<QnaVO> historyBoardList(SearchCriteria cri) {
		return memberMapper.historyBoardList(cri);
	}

	@Override
	public List<Integer> historyRowCount(SearchCriteria cri) {
		return memberMapper.historyRowCount(cri);
	}

	@Override
	public int useridDuplicate(MemberVO memberVO) {
		return memberMapper.useridDuplicate(memberVO);
	}

	@Override
	public int getAuth(AuthKeyDTO authKeyDTO) {
		return memberMapper.getAuthKey(authKeyDTO);
	}

	@Override
	public int nicknameDuplicate(MemberVO memberVO) {
		return memberMapper.nicknameDuplicate(memberVO);
	}

	@Override
	public int emailDuplicate(MemberVO memberVO) {
		return memberMapper.emailDuplicate(memberVO);
	}

	@Transactional
	@Override
	public int sendAuthkey(AuthKeyDTO authdto) {
		// 1. db에 인증키 저장
		Random r = new Random();
		int dice = r.nextInt(8990) + 1001; // 이메일로 받는 인증코드 부분 (난수)
		authdto.setAuthkey(dice);
		int result = memberMapper.sendAuthkey(authdto);
		// 2. 인증키 전송
		if (result == 1) {
			String to = authdto.getEmail();
			String subject = "회원가입 인증메일";
			String body = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

					System.getProperty("line.separator") +

					"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

					+ System.getProperty("line.separator") +

					System.getProperty("line.separator") +

					" 인증번호는 " + dice + " 입니다. "

					+ System.getProperty("line.separator") +

					System.getProperty("line.separator") +

					"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";

			try {
				mailService.authSendMail(to, subject, body);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return result;
	}

	@Override
	public int authKeyCheck(AuthKeyDTO authdto) {

		return memberMapper.authKeyCheck(authdto);
	}

	@Override
	public int sendFindId(MemberVO membervo) {
		membervo = memberMapper.sendFindId(membervo);
		if (membervo != null) {
			membervo.setUserid(membervo.getUserid());
			String to = membervo.getEmail();
			String subject = "문의하신 계정 정보입니다";
			String body = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

					System.getProperty("line.separator") +

					"계정찾기"

					+ System.getProperty("line.separator") +

					System.getProperty("line.separator") +

					"아이디 : " + membervo.getUserid();
			try {
				mailService.authSendMail(to, subject, body);
			} catch (Exception e) {
				System.out.println(e);
			}
			return 1;
		}
		return 0;

	}
	@Transactional
	@Override
	public int sendFindPassword(MemberVO membervo) {
		Random r = new Random();
		String dice = Integer.toString(r.nextInt(8990) + 1001)+("!"); // 이메일로 받는 인증코드 부분 (난수)
		membervo = memberMapper.sendFindPassword(membervo);
		if(membervo != null) {
			String encodedPassword = bCryptPasswordEncoder.encode(dice);
			if(bCryptPasswordEncoder.matches(dice, encodedPassword)) {
				membervo.setUserid(membervo.getUserid());
				membervo.setUserpw(bCryptPasswordEncoder.encode(dice));
			}
			
			String to = membervo.getEmail();
			String subject = "문의하신 계정 정보입니다";
			String body = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

					System.getProperty("line.separator") +

					"계정찾기"

					+ System.getProperty("line.separator") +

					System.getProperty("line.separator") +

					"임시 비밀번호 : " + dice;
			try {
				mailService.authSendMail(to, subject, body);
				memberMapper.passwordChange(membervo);
			} catch (Exception e) {
				System.out.println(e);
			}
			

			return 1;
		}
		return 0;
	}
	
}