package util;

public class Function {
	
	public static String checkNull(String str) {
		String strTmp;
		if (str == null)
			strTmp = "";
		else
			strTmp = str.trim();
		return strTmp;
	}
	
	public static String randomNumber(String str){
		str = checkNull(str);
		String sr = "";
		for(int i=1; i <= 2; i++){
		char ch = (char)((Math.random()*26)+65);
		sr += ch;
		}
		
		String num = "";
		for(int i=1; i <= 2; i++){
		int n =	(int) Math.round(Math.random()*9);
		num += n;
		}
	
		
		return str;
	}
	

}
