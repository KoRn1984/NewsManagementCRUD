package by.itacademy.matveenko.jd2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import by.itacademy.matveenko.jd2.bean.News;
import by.itacademy.matveenko.jd2.service.INewsService;
import by.itacademy.matveenko.jd2.service.ServiceException;

@Controller
@RequestMapping("/news")
public class NewsController {
	private static final int COUNT_NEWS = 5;	
	private static final String ALL_NEWS = "allNews";
	private static final String ADD_NEWS = "newsAdd";
	private static final String EDIT_NEWS = "newsEdit";
	private static final String VIEW_NEWS = "newsView";	
	private static final String USER_ACTIVE = "active";
	private static final String USER_NOT_ACTIVE = "not_active";
	private static final String PAGE_NUMBER = "pageNo";
	private static final String CURRENT_PAGE = "currentPage";
	private static final String COUNT_PAGE = "countPage";

	@Autowired
	private INewsService newsService;
	
	@GetMapping("/base_page")
    public String basePage(Model theModel) {
        try {
        	List<News> latestNews = newsService.latestList(COUNT_NEWS);
        	theModel.addAttribute(AttributsName.USER_STATUS, USER_NOT_ACTIVE);
        	theModel.addAttribute(AttributsName.NEWS, latestNews);
            return "baseLayout";
        } catch (ServiceException e) {
            return "error";
        }
    }
	
	@RequestMapping("/list")
    public String newsList(HttpServletRequest request, Model theModel) {
    	Integer pageNumber;
		Integer pageSize = 5;
		Integer countPage = 0;
		
		try {
			pageNumber = Integer.parseInt(request.getParameter(PAGE_NUMBER));
		} catch (NumberFormatException e) {
			pageNumber = 1;
		}		
		try {
			List<News> newsList = newsService.newsList(pageNumber, pageSize);
			countPage = newsService.countPage(pageSize);
			theModel.addAttribute(AttributsName.USER_STATUS, USER_ACTIVE);
			theModel.addAttribute(ALL_NEWS, newsList);
			theModel.addAttribute(CURRENT_PAGE, pageNumber);
			theModel.addAttribute(COUNT_PAGE, countPage);			
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}		
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {		
		News theNews = new News();
		theModel.addAttribute(ADD_NEWS, theNews);		
		return "baseLayout";
	}

	@PostMapping("/saveNews")
	public String save(@ModelAttribute(AttributsName.NEWS) News theNews, HttpServletRequest request) {
		try {			
			newsService.save(theNews);
			request.getSession(true).setAttribute(AttributsName.ADD_NEWS, AttributsName.COMMAND_EXECUTED);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/showFormForEdit")
	public String showFormForEdit(@RequestParam(AttributsName.NEWS_PARAMETER_ID) int theId, Model theModel) {
		try {
			News theNews = newsService.findById(theId);			
			theModel.addAttribute(EDIT_NEWS, theNews);			
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/view")
	public String viewNews(@RequestParam(AttributsName.NEWS_PARAMETER_ID) int theId, Model theModel) {
		try {			
			News theNews = newsService.findById(theId);
			theModel.addAttribute(VIEW_NEWS, theNews);			
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}
	}
	
	@GetMapping("/unpublish")
	public String unpublishNews(HttpServletRequest request) {
		String[] id = request.getParameterValues(AttributsName.NEWS_ID);
		try {			
			newsService.unpublishNewsById(id);
			request.getSession(true).setAttribute(AttributsName.UNPUBLISH_NEWS, AttributsName.COMMAND_EXECUTED);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/delete")
	public String deleteNews(@RequestParam(AttributsName.NEWS_PARAMETER_ID) int idNews, HttpServletRequest request) {
		try {			
			newsService.deleteNewsById(idNews);
			request.getSession(true).setAttribute(AttributsName.DELETE_NEWS, AttributsName.COMMAND_EXECUTED);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}
}