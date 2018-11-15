using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantPicker
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DTO.User user = DAL.User.GetUser(1);
            Button login = (Button)Master.FindControl("btn_Login");
            if (login != null)
            {
                login.Visible = false;
                
            }
            
            
            lbl_Greeting.Text = "Welcome, " + user.Fname + "!";

            lbl_FirstName.Text = user.Fname;
            lbl_LastName.Text = user.Lname;
            lbl_Email.Text = user.Email;
            lbl_Zip.Text = (user.Zipcode == "") ? "N/A" : user.Zipcode;
        }
    }
}