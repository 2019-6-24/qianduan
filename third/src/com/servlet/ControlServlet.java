package com.servlet;

import com.util.Action;
import com.util.ActionFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControlServlet")
public class ControlServlet extends HttpServlet {

    private static final long serialVersionUID=1L;

    protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        String pathName=request.getServletPath();
        System.out.println("pathName"+pathName);
        int index=pathName.indexOf(".");
        String ActionName=pathName.substring(1,index);
        System.out.println(ActionName);
        String ActionClassName=this.getInitParameter(ActionName);
        Action action=ActionFactory.getActionFactory().getAction(ActionClassName);
        String url=null;
        try {
            url=action.execute(request,response);
            if(url==null)
            {
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher(url).forward(request,response);
            }
        }catch (Exception e)
        {

        }finally {
            if(url==null)
            {
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher(url).forward(request,response);
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
