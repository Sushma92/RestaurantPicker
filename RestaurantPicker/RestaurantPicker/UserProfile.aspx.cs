using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RestaurantPicker
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                DTO.User user = (DTO.User)Session["CurrentUser"];
                lbl_FirstName.Text = user.Fname;
                lbl_LastName.Text = user.Lname;
                lbl_Email.Text = user.Email;
                lbl_Zip.Text = (user.Zipcode == "") ? "N/A" : user.Zipcode;
            }
            
        }

        protected DataTable Rating_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            if (Session["CurrentUser"] != null)
            {

                DAL.Rating rat = (DAL.Rating)Session["CurrentUser"];
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandText = "Select Rest_Name, Rating, Review, Street, Zipcode from Main_Restaurant INNER JOIN Rating where Main_Restaurant.Rest_ID == Rating.Rest_ID";
                        conn.Open();

                        using (SqlDataAdapter adapter = new SqlDataAdapter())
                        {
                            adapter.SelectCommand = cmd;
                            adapter.Fill(dt);
                        }
                    }
                }
                return dt;
            }
            return dt;
        }
    }
}