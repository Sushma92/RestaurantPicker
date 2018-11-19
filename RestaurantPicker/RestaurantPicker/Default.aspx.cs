﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace RestaurantPicker
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DTO.User user = DAL.User.GetUser(2);
            //Label1.Text = user.Fname;

        }

        protected void btn_Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RestaurantSearch.aspx");
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            bool j = DAL.User.default_Login(tb_InputEmail.Text, tb_InputPassword.Text);
            if (j)
                Response.Redirect("~/RestaurantSearch.aspx");
            else
                Response.Redirect("~/Default.aspx");
        }
    }
}