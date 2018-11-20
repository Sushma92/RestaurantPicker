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

        public static DTO.User GetUser(String email)
        {
            DTO.User user = new DTO.User();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Fname, Lname, Email, Zipcode FROM [User] WHERE Email = @Email";
                    command.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = email;

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
                        if (Tools.Security.MD5Hash(tb_InputPassword) == reader["PasswordHash"].ToString())
                            return true;
                        else
                            return false;
                    }

                }
            }

            return false;


        }

        public static DTO.User Register(string Fname, string Lname, string Email, string Password1, string Password2)
        {
            DTO.User user = new DTO.User();
            user.Fname = "";
            user.Lname = "";
            user.Email = "";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "Select Fname, Lname, Email from [User] where Email = @Email";
                    cmd.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = Email;
                    cmd.Connection = conn;
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {
                        if (rd.HasRows)
                        {
                            user.Fname = rd["Fname"].ToString();
                            user.Lname = rd["Lname"].ToString();
                            user.Email = rd["Email"].ToString();
                            return user;
                        }
                        else
                        {

                            cmd.Connection = conn;
                            string pass = Tools.Security.MD5Hash(Password1);

                            cmd.CommandText = "insert into [User] (Fname,Lname, Email, PasswordHash) values (@Fname,@Lname, @Email, @PasswordHash)";
                            cmd.Parameters.Add("@Fname", System.Data.SqlDbType.NVarChar).Value = Fname;
                            cmd.Parameters.Add("@Lname", System.Data.SqlDbType.NVarChar).Value = Lname;
                            //cmd.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = Email;
                            cmd.Parameters.Add("@PasswordHash", System.Data.SqlDbType.Char).Value = pass;//Password1;

                            rd.Close();
                            rd = cmd.ExecuteReader();
                            if (rd.Read())
                            {
                                user.Fname = rd["Fname"].ToString();
                                user.Lname = rd["Lname"].ToString();
                                user.Email = rd["Email"].ToString();

                                return user;
                            }

                        }

                        conn.Close();

                    }
                    return user;
                }


            }
        }

        









    }
}
        
        
            
                
            

