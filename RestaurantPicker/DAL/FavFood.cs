﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class FavFood
    {
        public static DataTable GetAllFoods()
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT Food_ID, Name FROM Food";

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
        public static bool SubmitFavFood(DTO.FavFood food)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    //command.CommandText = "INSERT INTO Favorite_Food (User_ID, Food_ID, Rest_ID, ZipCode, Street) VALUES (@User_ID,@Food_ID, @Rest_ID, @ZipCode, @Street)";
                    command.CommandText = "INSERT INTO Favorite_Food (User_ID, Food_ID, Rest_ID) VALUES (@User_ID,@Food_ID, @Rest_ID)";
                    command.Parameters.Add("@User_ID", SqlDbType.Int).Value = food.User_ID;
                    command.Parameters.Add("@Rest_ID", SqlDbType.Int).Value = food.Rest_ID;
                    //command.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = food.ZipCode;
                    //command.Parameters.Add("@Street", SqlDbType.NVarChar).Value = food.Street;
                    command.Parameters.Add("@Food_ID", SqlDbType.Int).Value = food.Food_ID;                    

                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch
                    {
                        Console.WriteLine("Unable to insert favorite food");
                    }
                }
            }
            return true;
        }

        public static void DeleteFavoriteFood(DTO.FavFood food)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "DELETE FROM Favorite_Food WHERE User_ID=@UserID AND Food_ID=@FoodID AND Rest_ID = @RestID";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = food.User_ID;
                    command.Parameters.Add("@RestID", SqlDbType.Int).Value = food.Rest_ID;
                    command.Parameters.Add("@FoodID", SqlDbType.Int).Value = food.Food_ID;
                    
                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch
                    {
                        Console.WriteLine("Unable to delete favorite food");
                    }
                }
            }
        }

        public static bool HasFavFood(DTO.FavFood favfood)
        {
            bool HasFav = false;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT User_ID FROM Favorite_Food WHERE User_ID = @UserID";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = favfood.User_ID;
                    
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null)
                        HasFav = true;
                    else
                        HasFav = false;
                }
            }
            return HasFav;
        }

        public static DataTable GetUserFavFood(Int32 user_id)//, string zipcode, string street)
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "SELECT DISTINCT Main_Restaurant.Rest_ID, Food.Food_ID, Food.Name, Favorite_Food.Street, Favorite_Food.ZipCode, Rest_Name FROM Favorite_Food FULL JOIN [Restaurant_Branch] ON Restaurant_Branch.Rest_ID = Favorite_Food.Rest_ID FULL JOIN Main_Restaurant ON Restaurant_Branch.Rest_ID = Main_Restaurant.Rest_ID FULL JOIN Food ON Favorite_Food.Food_ID = Food.Food_ID WHERE User_ID = @UserID";
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
        
    
    }
}
