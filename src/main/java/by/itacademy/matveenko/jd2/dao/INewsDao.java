package by.itacademy.matveenko.jd2.dao;

import java.util.List;

import by.itacademy.matveenko.jd2.bean.News;

public interface INewsDao {
	List<News> getNewsList() throws NewsDaoException;
	News fetchById(int idNews) throws NewsDaoException;
	void saveNews(News news) throws NewsDaoException;	
	void deleteNews(String[] idNews) throws NewsDaoException;
}