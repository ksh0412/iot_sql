package test.biz.tj.ch15;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ch16/ioc2.xml");
		IPrintMsg printMsg = (IPrintMsg) ctx.getBean("pMsg1");
		printMsg.hello1();
	}
}
