package by.itacademy.matveenko.jd2.dao.impl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.itacademy.matveenko.jd2.bean.News;
import by.itacademy.matveenko.jd2.controller.NewsParameter;
import by.itacademy.matveenko.jd2.dao.INewsDao;
import by.itacademy.matveenko.jd2.dao.NewsDaoException;
import by.itacademy.matveenko.jd2.service.impl.LocalDateAttributeConverter;

@Repository
public class NewsDao implements INewsDao {
	private static final String DATE_PATTERN = "yyyy-MM-dd";
	private static final String UNPUBLISHED = "no";
	private static final String PUBLISHED = "yes";
	private static final String ID_ADMIN_ROLE = "1";

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private LocalDateAttributeConverter converter;

	private static final String SHOW_NEWS = "from News order by date desc";
	@Override
	public List<News> getNewsList() throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();			
			Query<News> theQuery = currentSession.createQuery(SHOW_NEWS, News.class);
			//theQuery.setParameter(NewsParameter.PUBLISHED_NEWS, PUBLISHED);
			List<News> listNews = theQuery.getResultList();
			return listNews;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong with the database", e);
		}
	}
	
	@Override
	public News fetchById(int idNews) throws NewsDaoException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			News theNews = currentSession.get(News.class, idNews);
			return theNews;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not find news.", e);
		}
	}

	@Override
	public void saveNews(News news) throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();
			news.setPublished(PUBLISHED);
			news.setAuthor(ID_ADMIN_ROLE);
			//news.setDate(Date.valueOf(LocalDate.now()));
			
			//var date = converter.convertToDatabaseColumn(LocalDate.now());
			currentSession.saveOrUpdate(news);
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Failed to save news", e);
		}
	}	
	
	private static final String DELETE_NEWS = "delete from News where id=:id";
	@Override
	public void deleteNews(String[] idNews) throws NewsDaoException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query<News> theQuery = currentSession.createQuery(DELETE_NEWS, News.class);
			theQuery.setParameter("idNews", idNews);
			theQuery.executeUpdate();
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not delete news.", e);
		}
	}
}