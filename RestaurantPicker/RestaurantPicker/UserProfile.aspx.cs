using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RestaurantPicker
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    DTO.User user = (DTO.User)Session["CurrentUser"];
                    lbl_FirstName.Text = user.Fname;
                    lbl_LastName.Text = user.Lname;
                    lbl_Email.Text = user.Email;
                    lbl_Zip.Text = (user.Zipcode == "") ? "N/A" : user.Zipcode;

                    lbl_Greeting.Text = "Welcome, " + user.Fname;

                    gv_UserRatings.DataSource = DAL.Rating.GetUserRatings(user.UserID);
                    gv_UserRatings.DataBind();
                }
            }
            
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "EditModal", "$('#EditModal').modal();", true);
        }

        protected void btn_SubmitChanges_Click(object sender, EventArgs e)
        {
            DTO.User user = new DTO.User();
            user.UserID = ((DTO.User)Session["CurrentUser"]).UserID;
            user.Fname = tb_Fname.Text;
            user.Lname = tb_Lname.Text;
            user.Zipcode = (tb_ZipCode.Text != "") ? tb_ZipCode.Text : "";
            user.Email = tb_Email.Text;

            if (DAL.User.UpdateUser(user))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "EditModal", "$('#EditModal').modal('hide');", true);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}