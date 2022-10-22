package by.itacademy.matveenko.jd2.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.itacademy.matveenko.jd2.bean.News;
import by.itacademy.matveenko.jd2.dao.INewsDao;
import by.itacademy.matveenko.jd2.dao.NewsDaoException;
import by.itacademy.matveenko.jd2.service.INewsService;
import by.itacademy.matveenko.jd2.service.ServiceException;

@Service
public class NewsService implements INewsService {
	private static final String PUBLISHED = "yes";
	//private static final String UNPUBLISHED = "no";
	private static final int ID_ADMIN_ROLE = 43;

	@Autowired
	private INewsDao newsDao;
			
	@Transactional
	@Override
	public List<News> newsList() throws ServiceException {
		try {
			return newsDao.getNewsList();
		} catch (NewsDaoException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void save(News news) throws ServiceException {
		try {			
			news.setDate(LocalDate.now());
			news.setPublished(PUBLISHED);
			news.setAuthor(ID_ADMIN_ROLE);
			newsDao.saveNews(news);		
		} catch (NewsDaoException e) {
			throw new ServiceException(e);
		}
	}
	
	@Transactional
	@Override
	public News findById(int idNews) throws ServiceException {
		try {
			return newsDao.fetchById(idNews);
		} catch (NewsDaoException e) {
			throw new ServiceException(e);
		}
	}
	
	@Transactional
	@Override
	public void unpublishNewsById(int idNews) throws ServiceException {
		try {			
			newsDao.unpublishNews(idNews);		
		} catch (NewsDaoException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void deleteNewsById(int idNews) throws ServiceException {
		try {
			newsDao.deleteNews(idNews);
		} catch (NewsDaoException e) {
			throw new ServiceException(e);
		}
	}	
}