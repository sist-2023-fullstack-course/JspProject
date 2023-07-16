package com.sist.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.ProductDAO;
import com.sist.vo.ProductVO;

public class crawling {
	static String doCrawling() throws IOException{
		int cnt = 1;
		String base_url = "https://www.dogpang.com/shop/goods/goods_best.php?";
		
		JSONArray ret = new JSONArray();
		for(int page = 1; page <= 37; page++) {
			Document listpage = Jsoup.connect(base_url+"page="+page).get();
			
			Elements itemlinks = listpage.select(".flex-item > .flex-root > a.flex-link");
			for(Element itemlink : itemlinks) {
				String detail_url = itemlink.attr("abs:href");
				Document itempage = Jsoup.connect(detail_url).get();
				
				String name = itempage.getElementById("viewName").text();
				String category = itempage.selectFirst("#location > a").text();
				
				Elements priceInfo = itempage.select(".price-sell");
				String price = priceInfo.get(0).select(".num").text();
				String discount_price;
				if(priceInfo.size()==2) {
					discount_price = null;
				}
				else {
					discount_price = priceInfo.get(1).select(".num").text();
				}
				String delivery = itempage.selectFirst(".free_delivery_check").text();
				String poster = itempage.getElementById("photo_detail").attr("src");
				Elements itemInfos = itempage.select(".add-info");
				HashMap<String, String> info = new HashMap<>();
				for(Element iteminfo : itemInfos) {
					String dt = iteminfo.select("dt").text();
					String dl = iteminfo.select("dd").text();
					info.put(dt, dl);
				}
				
				HashMap<String, Object> hash = new HashMap<String, Object>();
				hash.put("name", name);
				hash.put("category", category);
				hash.put("price", price);
				hash.put("discount_price", discount_price);
				hash.put("delivery", delivery);
				hash.put("poster", poster);
				hash.put("info", info);

				JSONObject obj = new JSONObject(hash);
				ret.add(obj);
				System.out.println(cnt++ + " : " + name);
			}
		}
		
		System.out.println("작성완료");
		return ret.toJSONString();
	}
	
	public static void insertIntoDB(JSONArray data) {
		for(int i=0;i<data.size();i++) {
			JSONObject product = (JSONObject)data.get(i);
			ProductVO vo = new ProductVO();
			
			vo.setName((String)product.get("name"));
			vo.setCategory((String)product.get("category"));
			vo.setDelivery((String)product.get("delivery"));
			vo.setPoster((String)product.get("poster"));
			
			String price = (String)product.get("price");
			price = price.replaceAll(",", "");
			price = price.replaceAll("원", "");
			price = price.split(" ")[0];
			vo.setPrice(Integer.parseInt(price));
			
			String discount_price = (String)product.get("discount_price");
			if(discount_price!=null) {
				discount_price = discount_price.replaceAll(",", "");
				discount_price = discount_price.replaceAll("원", "");
				discount_price = discount_price.split(" ")[0];
			}
			else {
				discount_price = price;
			}
			vo.setDiscount_price(Integer.parseInt(discount_price));
			
			vo.setStar_cnt(0);
			vo.setStar_sum(0);
			JSONObject info = (JSONObject)product.get("info");
			vo.setInfo(info.toJSONString());
			
			ProductDAO.newInstance().insertProduct(vo);
			break;
		}
	}
	
	public static void main(String[] args) throws IOException, ParseException{
//		BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:\\Users\\1004d\\git\\JspProject\\src\\main\\java\\com\\sist\\common\\product.json"),"utf-8"));
//		
//		out.write(doCrawling());
//		out.flush();
//		out.close();
		BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream("C:\\Users\\1004d\\git\\JspProject\\src\\main\\java\\com\\sist\\common\\product.json"), "utf-8"));
		StringBuffer sb = new StringBuffer();
		String line;
		while((line=in.readLine())!=null) {
			sb.append(line);
		}
		JSONParser p = new JSONParser();
		JSONArray arr = (JSONArray)(p.parse(sb.toString()));
		insertIntoDB(arr);
	}
}