﻿using System;
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
                btn_Login.Visible = false;
                a_UserProfile.Visible = true;
                a_UserProfile.InnerText = "Welcome Back, " + user.Fname + "!";
            }
            else
            {
                btn_Login.Visible = true;
                a_UserProfile.Visible = false;
            }
        }
    }
}