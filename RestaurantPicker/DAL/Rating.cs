using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Rating
    {
        public static DataTable GetAllRatings(Int32 rest_id, string zipcode, string street)
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Fname, Lname, Rating, Review FROM Rating FULL JOIN [User] ON UserID = User_ID WHERE Rest_ID = @ID AND Rating.ZipCode = @Zip AND Street = @Street";
                    command.Parameters.Add("@ID", SqlDbType.Int).Value = rest_id;
                    command.Parameters.Add("@Zip", SqlDbType.NVarChar).Value = zipcode;
                    command.Parameters.Add("@Street", SqlDbType.NVarChar).Value = street;

                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }

        public static Int32 GetAvgRating(Int32 rest_id, String zipcode, String street)
        {
            Int32 rating = 0;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT AVG(Rating) AS Avg FROM Rating WHERE Rest_ID = @ID AND ZipCode = @Zip AND Street = @Street";
                    command.Parameters.Add("@ID", SqlDbType.Int).Value = rest_id;
                    command.Parameters.Add("@Zip", SqlDbType.NVarChar).Value = zipcode;
                    command.Parameters.Add("@Street", SqlDbType.NVarChar).Value = street;

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {   
                        rating = (reader["Avg"] == DBNull.Value) ? 0 : Convert.ToInt32(reader["Avg"]);
                    }
                }
            }
            return rating;
        }

        //public static DataTable GetUserRatings() {

        //}
    }
}
