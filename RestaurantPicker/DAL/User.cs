using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class User
    {
        public static DTO.User GetUser(int UserID)
        {
            DTO.User user = new DTO.User();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Fname, Lname, Email, Zipcode FROM [User] WHERE UserID = @ID";
                    command.Parameters.Add("@ID", System.Data.SqlDbType.Int).Value = UserID;

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

            return user;
        }
    }
}
