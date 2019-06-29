package com.util;

public class ActionFactory {
    private ActionFactory()
    {

    }
    private static ActionFactory af;
    public static ActionFactory getActionFactory()
    {
        if(af==null)
        {
            af=new ActionFactory();
        }
        return af;
    }

    public Action getAction(String ActionClassName)
    {
        Action action=null;
        try {
            action=(Action)Class.forName(ActionClassName).newInstance();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return action;
    }
}
