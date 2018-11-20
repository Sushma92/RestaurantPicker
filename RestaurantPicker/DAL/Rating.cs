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

        public static bool SubmitRating(DTO.Rating rating)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "INSERT INTO Rating (User_ID, Rest_ID, ZipCode, Street, Rating, Review) VALUES (@UserID, @RestID, @ZipCode, @Street, @Rating, @Review)";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = rating.UserID;
                    command.Parameters.Add("@RestID", SqlDbType.Int).Value = rating.Rest_ID;
                    command.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = rating.ZipCode;
                    command.Parameters.Add("@Street", SqlDbType.NVarChar).Value = rating.Street;
                    command.Parameters.Add("@Rating", SqlDbType.Int).Value = rating.StarRating;
                    command.Parameters.Add("@Review", SqlDbType.NVarChar).Value = rating.Review;

                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch
                    {
                        Console.WriteLine("Unable to insert review");
                    }
                }
            }
            return true;
        }

        public static bool HasUserReviewed(DTO.Rating rating)
        {
            bool HasReviewed = false;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT User_ID FROM Rating WHERE Rest_ID = @RestID AND Street = @Street AND User_ID = @UserID AND ZipCode = @ZipCode";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = rating.UserID;
                    command.Parameters.Add("@RestID", SqlDbType.Int).Value = rating.Rest_ID;
                    command.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = rating.ZipCode;
                    command.Parameters.Add("@Street", SqlDbType.NVarChar).Value = rating.Street;

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null)
                        HasReviewed = true;
                    else
                        HasReviewed = false;
                }
            }
            return HasReviewed;
        }

        public static DataTable GetUserRatings(Int32 user_id)//, string zipcode, string street)
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT DISTINCT Rating, Review, Rating.Street, Rating.ZipCode, Rest_Name FROM Rating FULL JOIN [Restaurant_Branch] ON Restaurant_Branch.Rest_ID = Rating.Rest_ID FULL JOIN Main_Restaurant ON Restaurant_Branch.Rest_ID = Main_Restaurant.Rest_ID WHERE User_ID = @UserID";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = user_id;

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
        //public static DataTable GetUserRatings() {

        //}
    }
}
