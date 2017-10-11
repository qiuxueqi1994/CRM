using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace View
{
    /// <summary>
    /// IsLogin 的摘要说明
    /// </summary>
    public class IsLogin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            Users u = context.Session["user"] as Users;
            context.Response.Write(u == null ? "1" : u.UserName);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}