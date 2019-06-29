package com.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.util.DB;

public class checkCity {
    private String city;
    private String area;
    private String neibor;

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city=city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getNeibor() {
        return neibor;
    }

    public void setNeibor(String neibor) {
        this.neibor = neibor;
    }

    public static boolean check(String city,String neibor) throws Exception
    {
        boolean flag=true;
        checkCity checkcity=null;
        Connection conn= DB.getConn();
        String sql="select * from cityinfo where city='"+city+"' and neibor='"+neibor+"'";
        Statement stmt= DB.getStatement(conn);
        ResultSet rs= DB.getResultset(stmt,sql);
        try {
            if(!rs.next())
            {
                flag=false;
                throw new Exception("未查询到对应的城市或小区");
            }
            else {
                /****
                if(!neibor.equals(rs.getString("neibor"))){
                    flag=false;
                    throw new Exception("无法查询该小区");
                }
                 *****/
                checkcity=new checkCity();
                checkcity.setCity(rs.getString("city"));
                checkcity.setNeibor(rs.getString("neibor"));
            }
        }catch (SQLException e)
        {
            e.printStackTrace();
        }finally {
            DB.close(rs);
            DB.close(stmt);
            DB.close(conn);
            //System.out.println(flag);
            return flag;
        }
    }
}
