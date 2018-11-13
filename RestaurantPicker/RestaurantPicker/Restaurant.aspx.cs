using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantPicker
{
    public partial class Restaurant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_Restaurants.DataSource = DAL.Restaurant.GetAllRestaurants();
            gv_Restaurants.ID = "Rest_ID";
            gv_Restaurants.DataBind();
        }
    }
}