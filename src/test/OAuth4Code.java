package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import weibo4j.Oauth;
import weibo4j.model.WeiboException;
import weibo4j.util.BareBonesBrowserLaunch;
/**
 * 高兴
 * @author DELL
 *
 */
public class OAuth4Code {
	public static String getToken() throws WeiboException{
		
		Oauth oauth = new Oauth();
		
		return oauth.authorize("code","1","1").toString();
		
	}
	public static void main(String [] args) throws WeiboException, IOException{
		Oauth oauth = new Oauth();
		BareBonesBrowserLaunch.openURL(oauth.authorize("code","1","1"));
		//System.out.println(oauth.authorize("code",args[0],args[1]));
		System.out.print("Hit enter when it's done.[Enter]:");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String code = br.readLine();
		System.out.println("code: " + code);
		try{
			System.out.println(oauth.getAccessTokenByCode(code));
		} catch (WeiboException e) {
			if(401 == e.getStatusCode()){
				System.out.println("Unable to get the access token.");
			}else{
				e.printStackTrace();
			}
		}
	}
}
