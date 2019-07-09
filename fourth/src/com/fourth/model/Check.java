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

    public static JSONObject cpriceMonth(String city)
    {
        System.out.println(city);
        Connection conn = DB.getConn();
        String sql = "select month,cprice_month from price_month where cityname='" + city + "';";
        System.out.println(sql);
        //String sql = "select cprice_month from cprice_month";
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        JSONObject json=new JSONObject();

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


                if(rs.next())
                {
                    System.out.println("进入赋值语句");
                    json.put("month",rs.getString("month"));
                    json.put("price",rs.getInt("cprice_month"));
                }

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

    public static JSONObject accJson(String city,String area)
    {
        System.out.println("accJson"+city);
        System.out.println("accJson"+area);
        Connection conn = DB.getConn();
        String sql = " select month,aprice_month from price_month where cityname='" + city + "' and areaname='" + area + "';";
        System.out.println(sql);
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        JSONObject json=new JSONObject();

        try {
            if (rs.wasNull()) {

            } else {
                System.out.println("进入accJson else分支");

                if(rs.next())
                {
                    System.out.println("accJson给json类型赋值");
                    json.put("month",rs.getString("month"));
                    json.put("aprice_month",rs.getString("aprice_month"));
                }

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

    public static int calPage(String sql)
    {
        System.out.println("Check.calPage"+sql);
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        int i=0;
        try {
            if (rs.wasNull()) {

            } else {
                System.out.println("进入calcuPage else分支");
                while (rs.next())
                {
                    i++;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            return i;
        }

    }

    public static JSONObject searPage(String sql)
    {
        System.out.println("Check.searPage"+sql);
        Connection conn = DB.getConn();
        Statement stmt = DB.getStatement(conn);
        ResultSet rs = DB.getResultset(stmt, sql);

        JSONObject json=new JSONObject();
        JSONArray array=new JSONArray();

        try {
            if (rs.wasNull()) {

            } else {
                System.out.println("进入searPage else分支");

                while (rs.next())
                {
                    JSONObject temp=new JSONObject();
                    System.out.println("searPage给json类型赋值");

                    temp.put("name",rs.getString("wuhan_community.name"));
                    temp.put("type",rs.getString("wuhan_community.type"));
                    temp.put("price",rs.getString("wuhan_community.price"));
                    temp.put("date",rs.getString("wuhan_community.date"));
                    temp.put("square",rs.getString("wuhan_community.square"));
                    temp.put("total_price",rs.getString("wuhan_community.total_price"));
                    temp.put("info",rs.getString("wuhan_community.info"));

                    array.add(temp);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            json.put("list",array);
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            return json;
        }

    }

    public static JSONObject alcJson(String sql)
    {
        Connection conn = DB.getConn();
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
                    temp.put("time",rs.getString("month"));
                    temp.put("price",rs.getString("aprice_month"));
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
}
