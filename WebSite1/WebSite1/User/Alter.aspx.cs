using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Alter : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtPassword.Focus();
        txtUserName.Text = Session["UserName"].ToString();
        txtUserName.Enabled = false;
        var user = db.User.Single(m => m.UserName == txtUserName.Text);
        lblQ1.Text = user.Q1.ToString();
        lblQ2.Text = user.Q2.ToString();
    }

    protected void btnAlter_Click(object sender, EventArgs e)
    {
        if (txtName.Text == "" || txtPassword.Text == "" || txtAddress.Text == "" || txtPhone.Text == "" || txtEmail.Text == "" || txtA1.Text == "" || txtA2.Text == "")
        {
            Response.Write("<script language=javascript>alert('请填写完整信息！');</script>");
            return;
        }
        var user = db.User.Single(m => m.UserName == txtUserName.Text);
        user.Name = txtName.Text;
        user.Password = txtPassword.Text;
        if (drop.Text == "男")
        {
            user.Sex = 1;
        }
        else if (drop.Text == "女")
        {
            user.Sex = 2;
        }
        user.Address = txtAddress.Text;
        user.PhoneNum = txtPhone.Text;
        user.Email = txtEmail.Text;
        user.A1 = txtA1.Text;
        user.A2 = txtA2.Text;
        db.SubmitChanges();
        Response.Write("<script language=javascript>alert('修改成功！');</script>");
        return;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }
}