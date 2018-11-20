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
            if (!IsPostBack)
            {
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ReviewModal", "$('#ReviewModal').modal();", false);
                if (Session["Restaurant"] != null)
                {
                    DTO.Restaurant value = Session["Restaurant"] as DTO.Restaurant;

                    DTO.Restaurant restaurant = DAL.Restaurant.GetRestaurant(value.Rest_ID, value.ZipCode, value.Street);
                    lbl_RestHeading.Text = restaurant.Rest_Name;
                    lbl_RestRating.Text = (DAL.Rating.GetAvgRating(value.Rest_ID, value.ZipCode, value.Street) == 0) ? "N/A Stars" : DAL.Rating.GetAvgRating(value.Rest_ID, value.ZipCode, value.Street).ToString() + " Stars";
                    Repeater1.DataSource = DAL.Rating.GetAllRatings(value.Rest_ID, value.ZipCode, value.Street);
                    Repeater1.DataBind();

                    Session["Restaurant"] = restaurant;

                    lbl_Rest_Street.Text = restaurant.Street;
                    lbl_Rest_City.Text = restaurant.City;
                    lbl_Rest_State.Text = restaurant.State;
                    lbl_Rest_Zip.Text = restaurant.ZipCode;

                    if (Session["CurrentUser"] != null)
                    {
                        btn_Review.Text = "Leave a Review!";
                    }
                    else
                    {
                        btn_Review.Text = "Login to Leave a Review";
                    }
                }
                else
                {
                    Response.Redirect("~/Error.aspx");
                }
            }
            
        }

        protected void btn_Review_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ReviewModal", "$('#ReviewModal').modal();", true);
            //UpdatePanel1.Update();
        }

        protected void btn_SubmitReview_Click(object sender, EventArgs e)
        {
            DTO.Rating rating = new DTO.Rating();
            rating.UserID = ((DTO.User)Session["CurrentUser"]).UserID;
            rating.Rest_ID = ((DTO.Restaurant)Session["Restaurant"]).Rest_ID;
            rating.ZipCode = ((DTO.Restaurant)Session["Restaurant"]).ZipCode;
            rating.Street = ((DTO.Restaurant)Session["Restaurant"]).Street;
            rating.StarRating = Convert.ToInt32(RadioButtonList1.SelectedValue);
            rating.Review = tb_Review.Text;

            if(DAL.Rating.SubmitRating(rating))
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ReviewModal", "$('#ReviewModal').modal('hide');", true);
        }
    }
}