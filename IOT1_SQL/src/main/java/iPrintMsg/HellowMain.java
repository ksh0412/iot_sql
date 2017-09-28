package iPrintMsg;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HellowMain {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ch16/ioc.xml");
		IPrintMsg printMsg = (IPrintMsg) ctx.getBean("testMsg");
		printMsg.hello();
		printMsg.hello1();
		printMsg.hello2();
//		IPrintMsg target = new IPrintMsgImpl();
//
//		// Proxy 빈껍데기 생성
//		ProxyFactory pf = new ProxyFactory();
//		pf.addAdvice(new MyAroundAdvice()); // 충고 add
//		pf.setTarget(target);  // 타겟 add
//		IPrintMsg proxy = (IPrintMsg) pf.getProxy();
//
//		proxy.hello();
//		proxy.hello2();
//		proxy.hello2();
	}
}
