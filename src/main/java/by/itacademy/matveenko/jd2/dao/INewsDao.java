package by.itacademy.matveenko.jd2.dao;

import java.util.List;

import by.itacademy.matveenko.jd2.bean.News;

public interface INewsDao {
	List<News> getNewsList() throws NewsDaoException;
	News fetchById(int idNews) throws NewsDaoException;
	void saveNews(News news) throws NewsDaoException;
	void unpublishNews(int idNews) throws NewsDaoException;
	void deleteNews(int idNews) throws NewsDaoException;
}