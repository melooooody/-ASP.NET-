using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UserHome : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "欢迎光临本商城";
        lblName.Text = Session["UserName"].ToString();
        var user = db.User.Single(m => m.UserName == Session["UserName"].ToString());
        Session["UserId"] = user.Id.ToString();
    }
}