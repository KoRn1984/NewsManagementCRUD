package by.itacademy.matveenko.jd2.dao;

import java.util.List;

import by.itacademy.matveenko.jd2.bean.News;

public interface INewsDao {
	List<News> getLatestList(int pageSize) throws NewsDaoException;
	List<News> getNewsList(int pageNumber, int pageSize) throws NewsDaoException;
	News fetchById(int idNews) throws NewsDaoException;
	void saveNews(News news) throws NewsDaoException;
	void unpublishNews(int idNews) throws NewsDaoException;
	void deleteNews(int idNews) throws NewsDaoException;
	int countNews() throws NewsDaoException;
}