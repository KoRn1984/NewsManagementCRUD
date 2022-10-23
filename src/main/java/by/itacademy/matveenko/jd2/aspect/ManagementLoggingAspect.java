package by.itacademy.matveenko.jd2.aspect;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ManagementLoggingAspect {		
	private Logger log = LogManager.getLogger(getClass().getName());
	
	@Pointcut("execution(* by.itacademy.matveenko.jd2.controller.*.*(..))")
	private void forControllerPackage() {}	
	
	@Pointcut("execution(* by.itacademy.matveenko.jd2.dao.*.*(..))")
	private void forDaoPackage() {}
	
	@Pointcut("execution(* by.itacademy.matveenko.jd2.service.*.*(..))")
	private void forServicePackage() {}
	
	@Pointcut("forControllerPackage() || forDaoPackage() || forServicePackage()")
	private void forAppFlow() {}
	
	@Before("forAppFlow()")
	private void before(JoinPoint joinPoint) {
		String method = joinPoint.getSignature().toShortString();
		log.info("=====>> in @Before: calling method: " + method);
		Object[] args = joinPoint.getArgs();
		for (Object tempArg : args) {
			log.info("=====>> argument: " + tempArg);
		}		
	}
	
	@AfterReturning(pointcut="forAppFlow()", returning="result")
	public void afterReturning(JoinPoint joinPoint, Object result) {	
		String method = joinPoint.getSignature().toShortString();
		log.info("=====>> in @AfterReturning: from method: " + method);
		log.info("=====>> result: " + result);	
	}
	
	@AfterThrowing(pointcut = "forAppFlow()", throwing = "exc")
    public void afterThrowingsAdvice(Throwable exc) {
        log.error(exc);
    }
}