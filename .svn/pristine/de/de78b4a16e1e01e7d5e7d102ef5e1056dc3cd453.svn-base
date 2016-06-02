package com.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class QianDuController {
    
    /**
     * 把请求参数转换为Map对象
     * 
     * @param request
     * @return
     */
    public static Map<String, String> copyRequestParameter2Map(HttpServletRequest request) {
        Map<String, String> parameterMap = new HashMap<String, String>();
        Set entrySet = request.getParameterMap().entrySet();
        for (Object entryi : entrySet) {
            Entry<String, String[]> entry = (Entry<String, String[]>) entryi;
            if (entry != null) {                
                String[] value = entry.getValue();
                if (value != null && value.length != 0 && !StringUtils.isEmpty(entry.getValue()[0])) {
                    parameterMap.put(entry.getKey(), entry.getValue()[0]);
                }                
            }            
        }
        return parameterMap;
    }
    @RequestMapping(value="/s",method=RequestMethod.GET)
    public void search(HttpServletRequest request,HttpServletResponse sresponse) throws ClientProtocolException, IOException{
        
        Map<String, String> params = copyRequestParameter2Map(request);
        
        String wd=request.getParameter("wd");
        
        if(StringUtils.isEmpty(wd)){
            sresponse.sendRedirect("http://www.zengjin.site");
            return;
        }
        StringBuffer url=new StringBuffer();
        url.append("http://www.baidu.com/s?wd="+wd.replaceAll(" ", "%20"));
        
        for (Entry<String, String> entry : params.entrySet()) {
            if (entry != null) {
                String value = entry.getValue();
                if (value != null && value.length() != 0 && !StringUtils.isEmpty(entry.getValue())) {
                    if(!entry.getKey().equals("wd")){
                        url.append("&"+entry.getKey()+"="+entry.getValue().replaceAll(" ", "%20"));
                    }                    
                }
            }

        }
        
        HttpClient httpclient=new DefaultHttpClient();
        HttpGet httpget=new HttpGet(url.toString());
        
        HttpResponse response = httpclient.execute(httpget);
        HttpEntity entity = response.getEntity();   
        if (entity != null) {
            
            InputStream instreams = entity.getContent();    
            String str = convertStreamToString(instreams);
            Document doc = Jsoup.parse(str);
            if(doc==null)sresponse.sendRedirect("http://www.zengjin.site");
            
            if(doc.getElementById("content_right")!=null)
                doc.getElementById("content_right").attr("style", "margin-top:65px;");
            
            if(doc.getElementById("content_left")!=null)
                doc.getElementById("content_left").attr("style", "padding-top:20px;");
            
            if(doc.getElementById("s_tab")!=null)
                doc.getElementById("s_tab").remove();
            
            if(doc.getElementById("u")!=null)
                doc.getElementById("u").remove();
            
            
            
            if(doc.getElementById("rs")!=null){
                Iterator<Element> iterator = doc.getElementById("rs").getElementsByTag("a").iterator();
                while(iterator.hasNext()){
                    Element element = iterator.next();
                    element.attr("href", element.attr("href").replace("/s", ""));
                }    
            }  
            Elements imgs = doc.getElementsByTag("img");
            Iterator<Element> iterator2 = imgs.iterator();
            while(iterator2.hasNext()){
                Element next = iterator2.next();
                if(next.attr("src").indexOf("/it/u=")>=0){
                    next.attr("src", next.attr("src").replace(next.attr("src").substring(0, next.attr("src").indexOf("it/u=")), "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/"));
                    continue;
                }
                if(next.attr("data-src").indexOf("/it/u=")>=0){
                    next.attr("data-src", next.attr("data-src").replace(next.attr("data-src").substring(0, next.attr("data-src").indexOf("it/u=")), "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/"));
                    continue;
                }
                if(next.attr("src").indexOf("http://imgsrc.baidu.com")>=0){
                    next.attr("src",next.attr("src").replace("http://imgsrc.baidu.com", "https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a"));
                    continue;
                }
                if(next.attr("src").indexOf("http://g.hiphotos.baidu.com")>=0){
                    next.attr("src",next.attr("src").replace("http://g.hiphotos.baidu.com", "https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy"));
                    continue;
                }
                String src=next.attr("src");
                String regEx="^http:.*hiphotos.baidu.com.*";
                Pattern pat = Pattern.compile(regEx);
                Matcher mat = pat.matcher(src);
                if(mat.find()){
                    String newStr=next.attr("src").replace(src.substring(0, (src.indexOf("baidu.com")+9)), "https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy");
                    next.attr("src",newStr);
                }
                
                
                
                
            }
            sresponse.getWriter().print(doc);
            httpget.abort();    
        }

    }
    
    public static void main(String[] args) {
        String regEx="^http:.*baidu.com.*";
        String s="http://g.hiphotos.baidu.com/image/h%3D200/sign=915fb1b0412309f7f86faa12420e0c39/caef76094b36acaff0c832d87bd98d1001e99cee.jpg";
        Pattern pat = Pattern.compile(regEx);
        Matcher mat = pat.matcher(s);
        boolean rs = mat.find();
        System.out.println(s.replace(s.substring(0, (s.indexOf("baidu.com")+9)), "https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy"));
    }

    
    public static String convertStreamToString(InputStream is) throws UnsupportedEncodingException {      
        BufferedReader reader = new BufferedReader(new InputStreamReader(is,"UTF-8"));      
        StringBuilder sb = new StringBuilder();      
       
        String line = null;      
        try {      
            while ((line = reader.readLine()) != null) {  
                sb.append(line +"\n");      
            }      
        } catch (IOException e) {      
            e.printStackTrace();      
        } finally {      
            try {      
                is.close();      
            } catch (IOException e) {      
               e.printStackTrace();      
            }      
        }      
        return sb.toString();      
    }  

    
}
