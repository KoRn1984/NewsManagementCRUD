package by.itacademy.matveenko.jd2.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import by.itacademy.matveenko.jd2.bean.News;
import by.itacademy.matveenko.jd2.dao.INewsDao;
import by.itacademy.matveenko.jd2.dao.NewsDaoException;

@Repository
public class NewsDao implements INewsDao {	
	//private static final String UNPUBLISHED = "no";
	
	@Autowired
	private SessionFactory sessionFactory;	

	private static final String SHOW_NEWS = "from News order by date desc";
	@Override
	public List<News> getNewsList() throws NewsDaoException {
		try {			
			Session currentSession = sessionFactory.getCurrentSession();			
			Query<News> theQuery = currentSession.createQuery(SHOW_NEWS, News.class);			
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
			currentSession.saveOrUpdate(news);
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Failed to save news", e);
		}
	}	
	
	private static final String DELETE_NEWS = "delete from News where id=:id";
	@Override
	public void deleteNews(int idNews) throws NewsDaoException {
		System.out.println(1);
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query query = currentSession.createQuery(DELETE_NEWS);
			System.out.println(idNews);
			query.setParameter("id", idNews);
			query.executeUpdate();
		} catch (Exception e) {
			throw new NewsDaoException("Something is wrong. Could not delete news.", e);
		}
	}
}