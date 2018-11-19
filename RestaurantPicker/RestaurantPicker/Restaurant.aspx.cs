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
            if (Session["Restaurant"] != null)
            {
                DTO.Restaurant value = Session["Restaurant"] as DTO.Restaurant;

                DTO.Restaurant restaurant = DAL.Restaurant.GetRestaurant(value.Rest_ID, value.ZipCode, value.Street);
                lbl_RestHeading.Text = restaurant.Rest_Name;
                lbl_RestRating.Text = (DAL.Rating.GetAvgRating(value.Rest_ID, value.ZipCode, value.Street) == 0) ? "N/A Stars" : DAL.Rating.GetAvgRating(value.Rest_ID, value.ZipCode, value.Street).ToString() + " Stars";
                Repeater1.DataSource = DAL.Rating.GetAllRatings(value.Rest_ID, value.ZipCode, value.Street);
                Repeater1.DataBind();

                lbl_Rest_Street.Text = restaurant.Street;
                lbl_Rest_City.Text = restaurant.City;
                lbl_Rest_State.Text = restaurant.State;
                lbl_Rest_Zip.Text = restaurant.ZipCode;

            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }
        }
    }
}