package stc.craw.s01;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Run {
	private WebDriver driver;
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:/chromedriver.exe";
	
	
	public static void mapCrawling(String word[], String searchWord) {
		Run test = new Run();
		String name = null;
		String address = null;
		String phone = null;
		List<WebElement> list;
 		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions options = new ChromeOptions();
		// 브라우저 띄우며 실행
		//options.setCapability("ignoreProtectedModeSettings", true);
		// 브라우저 띄우지 않고 실행
		options.addArguments("headless");

		test.driver = new ChromeDriver(options);

		String url = "https://map.kakao.com/";
		test.driver.get(url);
		
		// 검색창에 키워드 입력
		WebElement keyword = test.driver.findElement(By.id("search.keyword.query")); 
		
		for(int i = 0; i < word.length; i++) {
			keyword.sendKeys(searchWord + word[i] + " 스터디룸"); 
		//keyword.sendKeys("#서울 스터디룸"); 
		 
 		// 키워드 입력 후 엔터(click메소드 작동X → sendKeys(Keys.ENTER) 사용)
		WebElement click = test.driver.findElement(By.id("search.keyword.submit")); 
		click.sendKeys(Keys.ENTER); 
		
		try {Thread.sleep(2000);} catch (InterruptedException e) {;}
		
		list = test.driver.findElements(By.className("PlaceItem"));
		 
		for(WebElement el: list) {	
			name = el.findElement(By.className("link_name")).getText();
			address = el.findElement(By.cssSelector("p:nth-child(1)")).getText();
			phone = el.findElement(By.className("phone")).getText();
			if(!phone.equals("")&&name.contains("스터디")&&address.contains("경기")) {
				System.out.println("insert into MAP values("+ "(SELECT NVL(MAX(PRO_NUM), 0)+1 FROM MAP)"+", '"+ name +"', '"+ address +"', '"+ phone+"');");
			}
		}
		
  		try {Thread.sleep(2000);} catch (InterruptedException e) {;}

  		WebElement more = test.driver.findElement(By.id("info.search.place.more")); 
		more.sendKeys(Keys.ENTER);
 
		try {Thread.sleep(2000);} catch (InterruptedException e) {;}
		
		list = test.driver.findElements(By.className("PlaceItem"));
		
		for(WebElement el: list) {	
			name = el.findElement(By.className("link_name")).getText();
			address = el.findElement(By.cssSelector("p:nth-child(1)")).getText();
			phone = el.findElement(By.className("phone")).getText();
			if(!phone.equals("")&&name.contains("스터디")&&address.contains("경기")) {
				System.out.println("insert into MAP values("+ "(SELECT NVL(MAX(PRO_NUM), 0)+1 FROM MAP)"+", '"+ name +"', '"+ address +"', '"+ phone+"');");
			}
		}
		
		
		keyword.clear();
			
		}
		test.driver.close();
		test.driver.quit();	 
	}
	public static void main(String[] args) {
		Run run = new Run();
		String word1[] = { "종로구",  "중구", "용산구", "성동구", 
				"광진구", "동대문구", "중랑구", "성북구", "강북구", 
				"도봉구", "노원구", "은평구", "서대문구", "마포구", 
				"양천구", "강서구", "구로구", "금천구", "영등포구", 
				"동작구", "관악구", "서초구", "강남구", "송파구", "강동구"};
		String word2[] = { "수원시",  "성남시", "의정부시", "안양시", 
				"부천시", "광명시", "평택시", "동두천시", "안산시", 
				"고양시", "과천시", "의왕시", "구리시", "남양주시", 
				"오산시", "시흥시", "군포시", "하남시", "용인시", 
				"파주시", "이천시", "안성시", "김포시", "화성시", 
				"광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군"};
		run.mapCrawling(word1, "서울 ");
		run.mapCrawling(word2, "경기도 ");
	}

}
