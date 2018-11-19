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
            //gv_Restaurants.ID = "Rest_ID";
            gv_Restaurants.DataBind();
        }

        protected List<String> SetFilters()
        {
            List<String> filters = new List<string>(new String[] { "", "", "", "", "" });
            if (tb_Name.Text != "")
            {
                filters[0] = tb_Name.Text;
            }
            if (tb_City.Text != "")
            {
                filters[1] = tb_City.Text;
            }
            if (tb_State.Text != "")
            {
                filters[2] = tb_State.Text.ToUpper();
            }
            if (tb_ZipCode.Text != "")
            {
                filters[3] = tb_ZipCode.Text;
            }
            if (tb_Street.Text != "")
            {
                filters[4] = tb_Street.Text;
            }

            return filters;
        }

        protected void gv_Restaurants_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_Restaurants.DataSource = DAL.Restaurant.GetAllRestaurants(SetFilters());
            //gv_Restaurants.ID = "Rest_ID";
            gv_Restaurants.PageIndex = e.NewPageIndex;
            gv_Restaurants.DataBind();

        }

        protected void btn_SearchRestaurants_Click(object sender, EventArgs e)
        {
            gv_Restaurants.DataSource = DAL.Restaurant.GetAllRestaurants(SetFilters());
            //gv_Restaurants.ID = "Rest_ID";
            gv_Restaurants.DataBind();
        }

        protected void btn_ResetSearch_Click(object sender, EventArgs e)
        {
            tb_City.Text = "";
            tb_Name.Text = "";
            tb_State.Text = "";
            tb_Street.Text = "";
            tb_ZipCode.Text = "";
            gv_Restaurants.DataSource = DAL.Restaurant.GetAllRestaurants();
        }

        protected void gv_Restaurants_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DTO.Restaurant restaurant = new DTO.Restaurant();
                restaurant.Rest_ID = Convert.ToInt32(gv_Restaurants.DataKeys[index]["Rest_ID"]);
                //restaurant.Rest_ID = Convert.ToInt32(gv_Restaurants.Rows[index].Cells[0].Text);
                restaurant.ZipCode = gv_Restaurants.Rows[index].Cells[5].Text;
                restaurant.Street = gv_Restaurants.Rows[index].Cells[2].Text;

                Session["Restaurant"] = restaurant;

                Response.Redirect("~/Restaurant.aspx");
            }
        }
    }
}