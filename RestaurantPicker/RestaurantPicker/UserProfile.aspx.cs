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
            Int32 userID = 0;
            Int32.TryParse(Request.QueryString["id"], out userID);
            if (userID != 0 && Session["CurrentUser"] != null)//()
            {
                DTO.User UserPage = DAL.User.GetUser(userID);
                DTO.User CurrentUser = (DTO.User)Session["CurrentUser"];
                    
                if (UserPage.UserID == CurrentUser.UserID)
                {
                    lbl_FirstName.Text = CurrentUser.Fname;
                    lbl_LastName.Text = CurrentUser.Lname;
                    lbl_Email.Text = CurrentUser.Email;
                    lbl_Zip.Text = (CurrentUser.Zipcode == "") ? "N/A" : CurrentUser.Zipcode;

                    lbl_Greeting.Text = "Welcome, " + UserPage.Fname;

                    
                    lbl_Greeting.Visible= true;
                    btn_Edit.Visible=true;

                    FSearch.Visible = true;

                    if (!IsPostBack)
                    {
                        gv_UserRatings.DataSource = DAL.Rating.GetUserRatings(UserPage.UserID);
                        gv_UserRatings.DataBind();
                    }
                }
                else
                {
                    lbl_FirstName.Text = UserPage.Fname;
                    lbl_LastName.Text = UserPage.Lname;
                    lbl_Email.Text = UserPage.Email;
                    lbl_Zip.Text = (UserPage.Zipcode == "") ? "N/A" : UserPage.Zipcode;

                    lbl_Greeting.Visible=false;
                    btn_Edit.Visible = false;
                    FSearch.Visible = false;
                    if (!IsPostBack)
                    {
                        gv_UserRatings.DataSource = DAL.Rating.GetUserRatings(UserPage.UserID);
                        gv_UserRatings.DataBind();
                    }
                    
                }                    
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
            if (!IsPostBack)
            {
                gv_FriendSearch.DataSource = DAL.User.GetAllUsers(userID);
                gv_FriendSearch.DataBind();

                gv_FriendList.DataSource = DAL.User.GetAllUsersFriends(userID);
                gv_FriendList.DataBind();
                lbl_Staus.Visible = false;
            }
            
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "EditModal", "$('#EditModal').modal();", true);
        }

        protected void btn_SubmitChanges_Click(object sender, EventArgs e)
        {
            DTO.User user = new DTO.User();
            int userID = 0;
            Int32.TryParse(Request.QueryString["id"], out userID);
            user.UserID = userID;//((DTO.User)Session["CurrentUser"]).UserID;
            user.Fname = tb_Fname.Text;
            user.Lname = tb_Lname.Text;
            user.Zipcode = (tb_ZipCode.Text != "") ? tb_ZipCode.Text : "";
            user.Email = tb_Email.Text;

            if (DAL.User.UpdateUser(user))
            {
                Session["CurrentUser"] = user;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "EditModal", "$('#EditModal').modal('hide');", true);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void gv_FriendSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Int32 friendID = Convert.ToInt32(gv_FriendSearch.DataKeys[index]["UserID"]);
                Int32 userID = ((DTO.User)Session["CurrentUser"]).UserID;

                if (DAL.User.AddFriend(friendID, userID))
                {
                    lbl_Staus.Text = "Friend Added Successfully!";
                }
                else
                {
                    lbl_Staus.Text = "Hmm... This friend may already be in your friend's list";
                }
                lbl_Staus.Visible = true;
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected List<String> SetFilters()
        {
            List<String> filters = new List<string>(new String[] { "", "", "", ""});
            if(tb_FriendFname.Text != "")
            {
                filters[0] = tb_FriendFname.Text;
            }
            if (tb_FriendLname.Text != "")
            {
                filters[1] = tb_FriendLname.Text;
            }
            if (tb_FriendEmail.Text != "")
            {
                filters[2] = tb_FriendEmail.Text;
            }
            if (tb_FriendZipCode.Text != "")
            {
                filters[3] = tb_FriendZipCode.Text;
            }

            return filters;
        }

        protected void gv_FriendSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_FriendSearch.DataSource = DAL.User.GetAllUsers(((DTO.User)Session["CurrentUser"]).UserID, SetFilters());
            gv_FriendSearch.PageIndex = e.NewPageIndex;
            gv_FriendSearch.DataBind();
        }

        protected void btn_SearchFriends_Click(object sender, EventArgs e)
        {
            gv_FriendSearch.DataSource = DAL.User.GetAllUsers(((DTO.User)Session["CurrentUser"]).UserID, SetFilters());
            gv_FriendSearch.DataBind();
        }

        protected void btn_ResetFriends_Click(object sender, EventArgs e)
        {
            tb_FriendFname.Text = "";
            tb_FriendLname.Text = "";
            tb_FriendZipCode.Text = "";
            tb_FriendEmail.Text = "";
            gv_FriendSearch.DataSource = DAL.User.GetAllUsers(((DTO.User)Session["CurrentUser"]).UserID);
            gv_FriendSearch.DataBind();
        }

        protected void gv_FriendList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Go")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Int32 friendID = Convert.ToInt32(gv_FriendList.DataKeys[index]["UserID"]);
                Response.Redirect(String.Format("~/UserProfile.aspx?id={0}", friendID));
            }
            
        }
    }
}