package com.fourth.model;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Check {

    private String city;
    private String area;
    private String neibor;

    public Check()
    {

    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNeibor() {
        return neibor;
    }

    public void setNeibor(String neibor) {
        this.neibor = neibor;
    }

    public String getArea() {

        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }


    public static Check checkmpCity(String city)
    {
        Check checkCity = null;
        System.out.println(city+"checkmpcity");
        Connection conn = DB.getConn();
        //String sql = "select * from city_use where cityname='" + city + "';";
        String sql = "select * from city_use where cityname='" + city + "';";
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);


        try {
            if (!rs.next()) {
                System.out.println("进入if分支");
            } else {
                System.out.println("进入else分支");
                checkCity = new Check();
                //checkCity.setCity(rs.getString("city"));
                //checkCity.setArea(rs.getString("area"));
                //checkCity.setNeibor(rs.getString("neibor"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            return checkCity;
        }

    }

    public static int cpriceMonth(String city)
    {
        System.out.println(city);
        Connection conn = DB.getConn();
        String sql = "select cityprice from city_use where cityname='" + city + "';";
        System.out.println(sql);
        //String sql = "select cprice_month from cprice_month";
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        int price=-1;


        try {
            /****
            if(rs!=null&&rs.next()){

                System.out.println("rs不为空");

            }else{

                System.out.println("rs为空");
            }
             ***/

            if (rs.wasNull()) {

            } else {
                System.out.println("进入else分支");
                //checkCity.setCity(rs.getString("city"));
                //checkCity.setArea(rs.getString("area"));
                //checkCity.setNeibor(rs.getString("neibor"));


                while (rs.next())
                {
                    System.out.println(rs.getString("cityprice"));
                    System.out.println("进入赋值语句");
                    price=rs.getInt("cityprice");
                }
                System.out.println(price+"else分支");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            System.out.println(price+"return");
            return price;
        }

    }

    public static JSONObject clcJson(String city)
    {
        System.out.println(city);
        Connection conn = DB.getConn();
        String sql = " select distinct month,cprice_month from (select * from price_month where cityname='" + city + "' order by id desc) as a;";
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        JSONObject json=new JSONObject();
        JSONArray array=new JSONArray();

        try {
            if (rs.wasNull()) {

            } else {
                System.out.println("进入else分支");

                int i=0;

                List<String>list=new ArrayList<>();
                while (rs.next())
                {
                    JSONObject temp=new JSONObject();
                    temp.put("time",rs.getString("month"));
                    temp.put("price",rs.getString("cprice_month"));
                    array.add(i,temp);
                    i++;
                }
                JSONArray t=new JSONArray();
                for(int j=0;j<array.size();j++)
                {
                    JSONObject n=array.optJSONObject(array.size()-j-1);
                    t.add(n);
                }
                json.put("list",t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            return json;
        }

    }

    public static JSONObject cacJson(String city)
    {
        System.out.println(city);
        Connection conn = DB.getConn();
        String sql = " select areaname,areaprice from city_use where cityname='" + city + "';";
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        JSONObject json=new JSONObject();
        JSONArray array=new JSONArray();

        try {
            if (rs.wasNull()) {

            } else {
                System.out.println("进入else分支");

                int i=0;

                while (rs.next())
                {
                    JSONObject temp=new JSONObject();
                    temp.put("areaname",rs.getString("areaname"));
                    temp.put("areaprice",rs.getString("areaprice"));
                    array.add(i,temp);
                    i++;
                }

                json.put("list",array);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            return json;
        }

    }
}
