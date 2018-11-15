using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantPicker
{
    public partial class Restaurant1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DTO.Restaurant restaurant = DAL.Restaurant.GetRestaurant(1, "10001", "151 W 34th St");

            lbl_RestHeading.Text = restaurant.Rest_Name;
            lbl_RestRating.Text = "N/A Stars";
            gv_ratings.EmptyDataText = "Sorry! No reviews have been left for this restaurant yet!\n To leave a review, please login!";
            gv_ratings.DataSource = null;
            gv_ratings.DataBind();

            lbl_Rest_Street.Text = restaurant.Street;
            lbl_Rest_City.Text = restaurant.City;
            lbl_Rest_State.Text = restaurant.State;
            lbl_Rest_Zip.Text = restaurant.ZipCode;
            
        }
    }
}