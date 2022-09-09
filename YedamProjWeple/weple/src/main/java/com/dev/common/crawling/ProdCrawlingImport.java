package com.dev.common.crawling;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.dev.dao.ProductDAO;
import com.dev.vo.Product;

public class ProdCrawlingImport {
	public void im(long id, int start, int end) {
		final String inflearnUrl = "https://www.ssg.com/service/emart/dvstore/category.ssg?dispCtgId="+id;
        Connection conn = Jsoup.connect(inflearnUrl);
        ProductDAO dao = new ProductDAO();
        
        
        try {
            Document document = conn.get();
            Elements imageElements = document.getElementsByClass("i1");
            Elements nameElements = imageElements;
            Elements priceElements = document.getElementsByClass("ssg_price");
            Elements unitElements = document.getElementsByClass("unit");
            
            
            for (int i = start; i<end; i++) {
            	String imgUrl = imageElements.get(i).attr("abs:src");
            	String prodNameText = nameElements.get(i).attr("abs:alt");
            	String prodName = prodNameText.substring(prodNameText.lastIndexOf("/") + 1);
            	String priceString = priceElements.get(i).text();
            	int price;
            	if(priceString.indexOf(",") > 0) {
            		price = Integer.parseInt(priceString.replace(",", ""));
            	} else {
            		price = Integer.parseInt(priceString);
            	}
            	String unitText = unitElements.get(i).text();
            	String unitString = unitText.substring(unitText.indexOf(":")+1).replace("원)", "");
            	int unit;
            	if(unitString.indexOf(",") > 0) {
            		unit = Integer.parseInt(unitString.replace(",", ""));
            	} else {
            		unit = Integer.parseInt(unitString);
            	}
            	int weight = (int)Math.ceil(price / (double)unit)*100;
            	
            	Product vo = new Product();
            	vo.setCatgLevel3((int)(id%100000));  
            	vo.setImgUrl(imgUrl);
            	vo.setProdName(prodName);
            	vo.setProdPrice(price);
            	vo.setWeight(weight);
            	dao.crawlingInsert(vo);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
        	e.printStackTrace();
        }
	}
}
