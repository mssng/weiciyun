package logic;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenStream;

import weibo4j.model.Status;
import weibo4j.org.json.JSONArray;
import weibo4j.org.json.JSONException;

/**
 * 词频统计类，根据微博输出词频统计信息
 * @author liudongwei
 * @version 0.0.9
 */
public class WordFreStat {

	private static Analyzer analyzer = new PaodingAnalyzer();
	/**
	 * 微博列表
	 */
	
	public static JSONArray execute(List<Status> statusList){
		Map<String, Integer> map = new HashMap<String, Integer>();
		JSONArray json = new JSONArray();
		
		for(Status s: statusList){
			String text = s.getText();
			wrap(map, parse(text), 1);
		}
		
		List<Map.Entry<String, Integer>> mapList = null;
		
		//将map转成arrayList
		mapList = new ArrayList<Map.Entry<String, Integer>>(map.entrySet());
		
		//通过比较器实现排序
		Collections.sort(mapList, new Comparator<Map.Entry<String, Integer>>(){

			@Override
			public int compare(Entry<String, Integer> o1,
					Entry<String, Integer> o2) {
				// TODO Auto-generated method stub
				return o2.getValue()-o1.getValue();
			}
			
		});
		
		/**
		 *排序操作
		 */
		int i=0;
		for(Map.Entry<String, Integer> maping:mapList){
			Map tmpMap = new HashMap();
			if(maping.getKey().length()>=2 && !maping.getKey().matches("[a-z0-9A-Z]+")&& maping.getKey().length()<=4){
				tmpMap.put("text", maping.getKey());
				tmpMap.put("freq", maping.getValue());
				try {
					json.put(i, tmpMap);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				i++;
			}
			if(i>40)
				break;
		}
		
		/*
		Iterator<String> its = map.keySet().iterator();
		
		while(its.hasNext()){
			String text = its.next();
			int freq = map.get(text);
			
		}*/
		
		return json;
	}
	
	public static String parse(String text){
		TokenStream tokenStream = analyzer.tokenStream(text, new StringReader(text));
		StringBuilder sb = new StringBuilder();
		Token t=null;
		try {
            while ((t = tokenStream.next()) != null)
            {
                sb.append(t.termText()+" ");
            }
        } catch (IOException e) {
           e.printStackTrace();
        }
		return sb.toString();
	}
	
	public static void wrap(Map<String, Integer> map, String text, int weight){
		for(String s:text.split(" ")){
			if(map.containsKey(s)){
				map.put(s, map.get(s)+weight);
			}else{
				map.put(s, weight);
			}
		}
	}
	
	public static void main(String[] argv){
	
	}
	
	/**
	 * 执行词频统计得到词与词的权重
	 * @return 词与词权重对应的Json格式数据
	 */
/*	public JSONArray execute(){
		List<Weibo> weiboList = toWeibo();
		SimpleWordPE swpe = new SimpleWordPE(weiboList);
		swpe.parse();
		swpe.calWeight();
		swpe.sortWeight();
		List<WordWeight> wordWeightList = swpe.getFinalResult();
		JSONArray j = new JSONArray();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		for(WordWeight ww:wordWeightList){
			map.put(ww.getWord(), ww.getWeight());
		}
		return j.put(map);
	}*/
	
/*	private List<Weibo> toWeibo(){
		List<Weibo> weiboList = new ArrayList<Weibo>();
		for(Status s :statusList){
			Weibo w = new Weibo(s.getText(), s.getRepostsCount());
			weiboList.add(w);
		}
		return weiboList;
	}*/
}
