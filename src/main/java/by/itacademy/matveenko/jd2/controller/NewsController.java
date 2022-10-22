package by.itacademy.matveenko.jd2.controller;

import java.util.List;

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

	@Autowired
	private INewsService newsService;

	@RequestMapping("/list")
	public String listNews(Model theModel) {
		try {
			List<News> theNews = newsService.newsList();
			theModel.addAttribute("allNews", theNews);
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {		
		News theNews = new News();
		theModel.addAttribute("newsAdd", theNews);
		return "baseLayout";
	}

	@PostMapping("/saveNews")
	public String save(@ModelAttribute("news") News theNews) {
		try {			
			newsService.save(theNews);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/showFormForEdit")
	public String showFormForEdit(@RequestParam("newsId") int theId, Model theModel) {
		try {
			News theNews = newsService.findById(theId);			
			theModel.addAttribute("newsEdit", theNews);			
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/view")
	public String viewNews(@RequestParam("newsId") int theId, Model theModel) {
		try {			
			News theNews = newsService.findById(theId);
			theModel.addAttribute("newsView", theNews);
			return "baseLayout";
		} catch (ServiceException e) {
			return "error";
		}
	}
	
	@GetMapping("/unpublish")
	public String unpublishNews(@RequestParam("newsId") int idNews) {
		try {			
			newsService.unpublishNewsById(idNews);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}

	@GetMapping("/delete")
	public String deleteNews(@RequestParam("newsId") int idNews) {
		try {			
			newsService.deleteNewsById(idNews);
			return "redirect:/news/list";
		} catch (ServiceException e) {
			return "error";
		}
	}
}