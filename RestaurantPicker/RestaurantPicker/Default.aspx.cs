using System;
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
            Response.Redirect("~/Restaurant.aspx");
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

        }
    }
}