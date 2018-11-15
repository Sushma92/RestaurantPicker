using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class Restaurant
    {
        public static DataTable GetAllRestaurants()
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Restaurant_Branch.Rest_ID, ZipCode, Street, City, State, Rest_Name, Web_Link FROM Restaurant_Branch INNER JOIN Main_Restaurant ON Restaurant_Branch.Rest_ID = Main_Restaurant.Rest_ID";

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

        public static DTO.Restaurant GetRestaurant(int RestID, string zipcode, string street)
        {
            DTO.Restaurant restaurant = new DTO.Restaurant();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Rest_Name, Web_Link, ZipCode, Street, City, State FROM Restaurant_Branch INNER JOIN Main_Restaurant ON Restaurant_Branch.Rest_ID = Main_Restaurant.Rest_ID WHERE Restaurant_Branch.Rest_ID = @ID AND ZipCode = @ZipCode AND Street = @Street";
                    command.Parameters.Add("@ID", System.Data.SqlDbType.Int).Value = RestID;
                    command.Parameters.Add("@ZipCode", System.Data.SqlDbType.NVarChar).Value = zipcode;
                    command.Parameters.Add("@Street", System.Data.SqlDbType.NVarChar).Value = street;

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        restaurant.Rest_Name = (reader["Rest_Name"] != null) ? reader["Rest_Name"].ToString() : "";
                        restaurant.Web_Link = (reader["Web_Link"] != null) ? reader["Web_Link"].ToString() : "";
                        restaurant.ZipCode = (reader["ZipCode"] != null) ? reader["ZipCode"].ToString() : "";
                        restaurant.State = (reader["State"] != null) ? reader["State"].ToString() : "";
                        restaurant.Street = (reader["Street"] != null) ? reader["Street"].ToString() : "";
                        restaurant.City = (reader["City"] != null) ? reader["City"].ToString() : "";
                    }

                }
                return restaurant;
            }
        }
    }
}
