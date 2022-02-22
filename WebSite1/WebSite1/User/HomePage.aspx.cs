using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_HomePage : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "欢迎光临本商城";
        if (Session["UserName"].ToString() == "")
        {
            Response.Write("<script language=javascript>alert('请登录！');</script>");
            Response.Redirect("~/Login.aspx");
        }
        lblName.Text = Session["UserName"].ToString();
        var user = db.User.Single(m => m.UserName == lblName.Text);
        txtUserName.Text = user.UserName.ToString(); txtUserName.Enabled = false;
        txtPassword.Text = user.Password.ToString();txtPassword.Enabled = false;
        txtName.Text = user.Name.ToString();txtName.Enabled = false;
        if (user.Sex == 1)
        {
            drop.Text = "男";
            drop.Enabled = false;
        }
        else
        {
            drop.Text = "女";
            drop.Enabled = false;
        }
        txtAddress.Text = user.Address.ToString();txtAddress.Enabled = false;
        txtPhone.Text = user.PhoneNum.ToString();txtPhone.Enabled = false;
        txtEmail.Text = user.Email.ToString();txtEmail.Enabled = false;
        lblQ1.Text = user.Q1.ToString();
        txtA1.Text = user.A1.ToString(); txtA1.Enabled = false;
        lblQ2.Text = user.Q2.ToString();
        txtA2.Text = user.Q2.ToString();txtA2.Enabled = false;
    }

    protected void btnAlter_Click(object sender, EventArgs e)
    {
        Response.Redirect("Alter.aspx");
    }

}