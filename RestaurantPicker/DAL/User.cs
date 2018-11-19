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

        public static bool default_Login(string tb_InputEmail, string tb_InputPassword)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = con;
                    comm.CommandText = "SELECT PasswordHash FROM [User] WHERE Email = @Email";
                    comm.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = tb_InputEmail;
                    
                    con.Open();
                    SqlDataReader reader = comm.ExecuteReader();
                    if (reader.Read())
                    {
                        //if (tb_InputPassword.GetHashCode().CompareTo(reader["PasswordHash"].ToString()) == 1)
                        if(Tools.Security.MD5Hash(tb_InputPassword) == reader["PasswordHash"].ToString())
                            return true;
                        else
                            return false;
                    }

                }
            }

            return false;


        }


    }
}
