package com.ncs.okky;

import com.ncs.service.ColumnService;
import com.ncs.service.ComunityService;
import com.ncs.service.JobsService;
import com.ncs.service.QnaService;
import com.ncs.util.SearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/index","/"})
	public ModelAndView index(ModelAndView mv) {
		SearchCriteria cri = new SearchCriteria();
		cri.setSnoEno();
		cri.setPerPageRow(5);
		mv.addObject("best",columnService.searchList(cri));
		cri.setPerPageRow(10);
		mv.addObject("qnalist",qnaService.searchList(cri));
		cri.setPerPageRow(20);
		mv.addObject("communitylist",comunityService.searchList(cri));

		mv.setViewName("index");
		return mv;
	}
	
}
