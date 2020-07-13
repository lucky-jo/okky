package com.ncs.service;

import com.ncs.mapper.MemberMapper;
import com.ncs.util.MailHandler;
import com.ncs.util.SearchCriteria;
import com.ncs.util.TempKey;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Autowired
    JavaMailSender mailSender;

    @Override
    public MemberVO read(String userid) {
        return memberMapper.read(userid);
    }

    @Transactional
    @Override
    public int register(MemberVO memberVO) throws MessagingException, UnsupportedEncodingException {
        AuthKeyDTO authKeyDTO = new AuthKeyDTO();
        TempKey tempKey = new TempKey();
        MailHandler mailHandler = new MailHandler(mailSender);
        String authkey = tempKey.getKey(50,true);
        authKeyDTO.setUserid(memberVO.getUserid());
        authKeyDTO.setAuthkey(authkey);
        mailHandler.setSubject("[홈페이지 이메일 인증");
        mailHandler.setText(
                "<h1>메일인증</h1>" +
                "<a href='http://localhost/member/authkey?userid=" + memberVO.getUserid() +
                "&authkey=" + authkey +
                "' target='_blenk'>이메일 인증 확인</a>");
        mailHandler.setFrom("last2599@gmail.com","Okkay");
        mailHandler.setTo(memberVO.getEmail());
        mailHandler.send();
        memberMapper.addAuthKey(authKeyDTO);
        memberMapper.addAuthKey(authKeyDTO);
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

}