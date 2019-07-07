package com.fourth.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class mcAction{
    /*****

    public mcAction() {
    }

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String city = new String(request.getParameter("city").getBytes("iso-8859-1"), "utf-8");
        String message = null;

        try {
            Check checkCity = new Check();
            if (city != null && !"".equals(city)) {
                if (!checkCity.checkmpCity(city)) {
                    message = "未能搜索到该城市！";
                    request.setAttribute("message", message);
                    System.out.println("未匹配不跳转");
                    return "index.jsp";
                } else {//匹配到城市
                    //调用python脚本获取城市信息（当前价格、参考均价、区域列表、图表数据
                    execPy(city);

                    //TODO 从数据库获取信息

                    request.setAttribute("result", "匹配成功跳转");
                    return "三级联动.jsp";
                }
            } else {
                message = "输入不能为空！";
                request.setAttribute("message", message);
                System.out.println("为空不跳转");
                return "index.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.close();
            return "index.jsp";
        }
    }

    public static void execPy(String city) throws Exception {

        Process process = null;

        try {
            System.out.println("开始执行脚本");
            String script = "E:\\Tomcat\\webapps\\java.py";
            String[] args = new String[]{"python", script, city};
            process = Runtime.getRuntime().exec(args);
            System.out.println("脚本执行完毕开始读取");
            InputStreamReader ir = new InputStreamReader(process.getInputStream(), "utf-8");
            BufferedReader in = new BufferedReader(ir);
            System.out.println("开始循环读取控制台信息");
            String result;
            for(int i = 0; (result = in.readLine()) != null; ++i) {
                System.out.println("循环输出脚本执行结果");
                String change = new String(result.getBytes("iso-8859-1"), "utf-8");
                System.out.println(change);
            }
            in.close();
            process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     ****/
}
