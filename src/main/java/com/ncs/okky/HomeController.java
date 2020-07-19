package com.ncs.okky;

import com.ncs.service.*;
import com.ncs.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.util.SearchCriteria;

import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	QnaService qnaService;

	@Autowired
	ComunityService comunityService;

	@Autowired
	ColumnService columnService;

	@Autowired
	JobsService jobsService;

	@Autowired
	TechService techService;

	@Autowired
	MemberService memberService;
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/index","/"})
	public ModelAndView index(ModelAndView mv) {
		SearchCriteria cri = new SearchCriteria();
		cri.setSnoEno();
		cri.setPerPageRow(5);
		List<ColumnVO> columnVOList = columnService.searchList(cri);
		List<MergeDTO<ColumnVO, MemberVO>> colMergelist = new ArrayList<>();
		for (ColumnVO columnVO : columnVOList) {
			MemberVO membervo = memberService.get(columnVO.getId());
			if( membervo != null ) {
				System.out.println(membervo.toString());
				colMergelist.add(new MergeDTO<>(columnVO, membervo));
			}
		}
		mv.addObject("best",colMergelist);
		cri.setPerPageRow(10);
		mv.addObject("qnalist",qnaService.searchList(cri));
		cri.setPerPageRow(20);
		List<ComunityVO> comunityVOList = comunityService.searchList(cri);
		List<MergeDTO<ComunityVO,MemberVO>> comMergelist = new ArrayList<>();
		for(ComunityVO comunityVO : comunityVOList) {
			MemberVO membervo = memberService.get(comunityVO.getId());
			if(membervo != null) {
				System.out.println(membervo.toString());
				comMergelist.add(new MergeDTO<>(comunityVO,membervo));
			}
		}
		mv.addObject("communitylist",comMergelist);
		cri.setPerPageRow(3);
		List<TechVO> techVOList = techService.searchList(cri);
		List<MergeDTO<TechVO,MemberVO>> techMergelist = new ArrayList<>();
		for(TechVO techVO : techVOList ) {
			MemberVO membervo = memberService.get(techVO.getId());
			if(membervo != null) {
				System.out.println(membervo.toString());
				techMergelist.add(new MergeDTO<>(techVO,membervo));
			}
		}
		mv.addObject("techlist",techMergelist);

		mv.setViewName("index");
		return mv;
	}
	
}
