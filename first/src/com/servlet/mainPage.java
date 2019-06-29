package com.servlet;

import com.bean.checkCity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@WebServlet(name = "com.servlet.mainPage")
public class mainPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        //设置文本显示方式和编码类型
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        //获取城市名、区域名、小区名
        String city=new String(request.getParameter("city").getBytes("iso-8859-1"),"utf-8");
        //String area=new String(request.getParameter("area").getBytes("iso-8859-1"),"utf-8");
        String neibor=new String(request.getParameter("neibor").getBytes("iso-8859-1"),"utf-8");

        //获取js脚本引擎
        //ScriptEngineManager mgr=new ScriptEngineManager();
        //ScriptEngine engine=mgr.getEngineByName("JavaScript");

        try
        {
            checkCity checkcity=new checkCity();
            if(neibor==null||"".equals(neibor))
            {
                out.print("<script type='text/javascript'>alert('未能匹配到该小区，已为您自动推选')</script>");
                //engine.eval("alert('未能匹配到该小区，已为您自动推选')");
                //TODO create new page
                request.getRequestDispatcher("localhost:8080/index.jsp");
            }
            else
            {
                //System.out.println("已经进入else语句");
                if(checkcity.check(city,neibor))
                {
                    execPy(city,neibor);
                    //TODO create certain page
                }
                else
                {
                    //TODO delete this code,databases needed
                    //System.out.println("已经执行");
                    out.print("<script type='text/javascript'>alert('未能匹配到该小区，已为您自动推选')</script>");
                    //execPy(city,neibor);
                    //TODO create new page
                }
                //out.println(city);
                //out.println(neibor);
            }
        }
        catch (Exception e)
        {

        }
        out.close();

    }

    public static void execPy(String city,String neibor) throws Exception
    {
        Process process=null;
        //File directory=new File("");
        try {
            //获取脚本路径
            //当前目录下java.py文件
            //String courseFile=directory.getCanonicalPath();
            //String script=courseFile+File.separator+"java.py";
            //绝对路径
            String script="E:\\Tomcat\\webapps\\Test1.py";
            String[] args=new String[]{"python",script,city,neibor};
            process=Runtime.getRuntime().exec(args);
            //获取脚本输出
            InputStreamReader ir=new InputStreamReader(process.getInputStream(),"utf-8");
            BufferedReader in=new BufferedReader(ir);
            String result;
            while ((result=in.readLine())!=null)
            {
                String change=new String(result.getBytes("iso-8859-1"),"utf-8");
                System.out.println(change);
            }
            in.close();
            process.waitFor();
            //System.out.println("执行完毕");
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    public String getServletInfo()
    {
        return "Short description";
    }

}
