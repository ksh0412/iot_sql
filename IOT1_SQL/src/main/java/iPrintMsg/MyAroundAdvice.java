package iPrintMsg;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class MyAroundAdvice implements MethodInterceptor
{
	public Object invoke(MethodInvocation invocation) throws Throwable{
		System.out.println("메소드 실행전 팍...");
		Object ret = invocation.proceed();
		System.out.println("메소드 실행후 씨...");
		return ret;
	}
}
