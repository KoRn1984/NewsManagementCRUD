package by.itacademy.matveenko.jd2.service;

import java.util.List;

import by.itacademy.matveenko.jd2.bean.News;

public interface INewsService {
	  List<News> latestList(int count) throws ServiceException;
	  List<News> newsList(int pageNumber, int pageSize) throws ServiceException;
	  News findById(int idNews) throws ServiceException;
	  void save(News news) throws ServiceException;
	  void unpublishNewsById(String[] idNews) throws ServiceException;
	  void deleteNewsById(int idNews) throws ServiceException;
	  int countPage(int countNewsPage) throws ServiceException;
}