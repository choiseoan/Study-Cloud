package stc.craw.s01.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Aspect
@Service
public class AdviceLog {
	 
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
 
	
	@Pointcut("execution(public * stc.craw.s01..*Controller.*(..))")
	public void controllerPointCut() {}
	
	@Pointcut("execution(public * stc.craw.s01..*Dao.*(..))")
	public void daoPointCut() {}
	
	@Pointcut("execution(public * stc.craw.s01..*ServiceImpl.*(..))")
	public void serviceImplPointCut() {}
	
	@Around("controllerPointCut()")
	public Object aroundControllerPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj = null;
		
		logger.info("▶Ctrl: {} {}", pjp.getThis(), pjp.getSignature().getName());
		
		Object[] args = pjp.getArgs();
		for(int i=0; i < args.length; i++) {
			logger.info("▶Ctrl args[{}]: {}", i, args[i]);
		}
		
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
				
		returnObj = pjp.proceed(); 
		stopwatch.stop();
		
		logger.info("▶Ctrl Return[{}]: {}", stopwatch.getTotalTimeMillis(), returnObj);
		
		return returnObj;
	}
	
	@Around("daoPointCut()")
	public Object aroundDaoPointCut(ProceedingJoinPoint pjp) throws Throwable {
		
		Object returnObj = null;
		logger.info("▶▶▶Dao: "+ pjp.getThis()+ " "+pjp.getSignature().getName());
		Object[] args = pjp.getArgs();
		for(int i=0; i < args.length; i++) {
			logger.info("▶▶▶Dao args["+i+"]: "+ args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		returnObj = pjp.proceed(); 
		stopwatch.stop();
		
		logger.info("▶▶▶DAO Return["+stopwatch.getTotalTimeMillis()+"]: " + returnObj);
		
		return returnObj;
	}	
	
	@Around("serviceImplPointCut()")
	public Object aroundserviceImplPointCut(ProceedingJoinPoint pjp) throws Throwable {
		
		Object returnObj = null;
		logger.info("▶▶Srvc: "+ pjp.getThis()+" "+ pjp.getSignature().getName());
				
		Object[] args = pjp.getArgs();
		for(int i=0; i < args.length; i++) {
			logger.info("▶▶Srvc args["+i+"]: "+ args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		returnObj = pjp.proceed(); 
		stopwatch.stop();
		
		logger.info("▶▶Srvc Return["+stopwatch.getTotalTimeMillis()+"]: " + returnObj);
		
		return returnObj;
	}
}
