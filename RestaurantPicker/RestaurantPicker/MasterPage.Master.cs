using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantPicker
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                DTO.User user = (DTO.User)Session["CurrentUser"];
                a_UserProfile.Visible = true;
                a_UserProfile.InnerText = "Welcome Back, " + user.Fname + "!";
                profileLink.HRef = String.Format("UserProfile.aspx?id={0}", user.UserID);
            }
            else
            {
                a_UserProfile.Visible = false;
            }
        }

        protected void btn_LogOut_Click(object sender, EventArgs e)
        {
            Session["CurrentUser"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}