package com.ncs.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.util.TempKey;
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

    @Override
    public MemberVO read(String userid) {
        return memberMapper.read(userid);
    }

    @Transactional
    @Override
    public int register(MemberVO memberVO) throws MessagingException, UnsupportedEncodingException {

    			
        AuthKeyDTO authKeyDTO = new AuthKeyDTO();
        TempKey tempKey = new TempKey();
        String authKey = tempKey.getKey(50, true);
        authKeyDTO.setAuthkey(authKey);
        authKeyDTO.setUserid(memberVO.getUserid());
        memberMapper.addAuthKey(authKeyDTO);
    	String body = "<h2>Okky 커뮤니티에 가입하신걸 환영 합니다!</h2><br><br>"
    			+ "<h3>" + memberVO.getUserid() + "님</h3><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : "
    			+ "<a href='http://localhost:8080/member/authKey?userid="+ memberVO.getUserid() +"&authkey="+authKey+"'>인증하기</a></p>";
        mailService.authSendMail(memberVO.getEmail(), "Okky 커뮤니티에 가입하신걸 환영 합니다.", body);
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

}