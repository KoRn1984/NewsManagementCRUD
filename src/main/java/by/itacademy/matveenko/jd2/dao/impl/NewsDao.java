package by.itacademy.matveenko.jd2.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import by.itacademy.matveenko.jd2.bean.News;
import by.itacademy.matveenko.jd2.controller.AttributsName;
import by.itacademy.matveenko.jd2.dao.INewsDao;
import by.itacademy.matveenko.jd2.dao.NewsDaoException;

@Repository
public class NewsDao implements INewsDao {
	private static final String NEWS_PUBLISHED = "yes";
	private static final String NEWS_UNPUBLISHED = "no";
		
	@Autowired
	private SessionFactory sessionFactory;
	
	private static final String SHOW_NEWS_LATEST_LIST = "from News where published=:paramPublished order by date desc";
	@Override
	public List<News> getLatestList(int pageSize) throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();			
			Query<News> query = currentSession.createQuery(SHOW_NEWS_LATEST_LIST, News.class);
			query.setParameter("paramPublished", NEWS_PUBLISHED);
			query.setMaxResults(pageSize);
			List<News> listNews = query.getResultList();
			return listNews;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong with the database!", e);
		}
	}

	private static final String SHOW_NEWS = "from News where published=:paramPublished order by date desc";
	@Override
	public List<News> getNewsList(int pageNumber, int pageSize) throws NewsDaoException {
		int startSize = (pageNumber - 1) * pageSize;
		try {			
			Session currentSession = sessionFactory.getCurrentSession();			
			Query<News> query = currentSession.createQuery(SHOW_NEWS, News.class);
			query.setParameter("paramPublished", NEWS_PUBLISHED);
			query.setFirstResult(startSize);
	        query.setMaxResults(pageSize);
			List<News> listNews = query.getResultList();
			return listNews;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong with the database!", e);
		}
	}
	
	@Override
	public News fetchById(int idNews) throws NewsDaoException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			News news = currentSession.get(News.class, idNews);
			return news;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not find news!", e);
		}
	}

	@Override
	public void saveNews(News news) throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.saveOrUpdate(news);
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Failed to save news!", e);
		}
	}
	
	private static final String UNPUBLISH_NEWS = "update News set published=:paramPublished where id=:id";
	@Override
	public void unpublishNews(String[] idNews) throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();
			for (String id : idNews) {
			Query query = currentSession.createQuery(UNPUBLISH_NEWS);
			query.setParameter("paramPublished", NEWS_UNPUBLISHED);
	        query.setParameter(AttributsName.NEWS_ID, Integer.parseInt(id));
			query.executeUpdate();
			}
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Failed to unpublish news!", e);
		}
	}
	
	private static final String DELETE_NEWS = "delete from News where id=:id";
	@Override
	public void deleteNews(int idNews) throws NewsDaoException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query query = currentSession.createQuery(DELETE_NEWS);
			query.setParameter("id", idNews);
			query.executeUpdate();
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not delete news!", e);
		}
	}
	
	private static final String COUNT_NEWS = "select count(*) from News where published = :paramPublished";
	@Override
	public int countNews() throws NewsDaoException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query query = currentSession.createQuery(COUNT_NEWS);
			query.setParameter("paramPublished", NEWS_PUBLISHED);
	        int count = ((Number)query.uniqueResult()).intValue();
	        return count;
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not to count the number of news!", e);
		}
	}
}