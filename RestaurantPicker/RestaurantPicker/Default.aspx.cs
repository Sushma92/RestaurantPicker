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
            //DTO.User user = DAL.User.GetUser(2);
            //Label1.Text = user.Fname;

            //So for some reason this works fine. but the second i try to move it to the DAL, its not fine
            DTO.User user = new DTO.User();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Fname, Lname, Email, Zipcode FROM [User] WHERE UserID = @ID";
                    command.Parameters.Add("@ID", System.Data.SqlDbType.Int).Value = 2;

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        user.Fname = (reader["Fname"] != null) ? reader["Fname"].ToString() : "";
                        user.Lname = (reader["Lname"] != null) ? reader["Lname"].ToString() : "";
                        user.Email = (reader["Email"] != null) ? reader["Email"].ToString() : "";
                        user.Zipcode = (reader["Zipcode"] != null) ? reader["Zipcode"].ToString() : "";
                    }
                }
            }
            Label1.Text = user.Fname + " " + user.Lname;
        }
    }
}