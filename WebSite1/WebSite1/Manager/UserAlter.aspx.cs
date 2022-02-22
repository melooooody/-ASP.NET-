using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_UserAlter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtAddress.Focus();
        txtUserName.Text = Session["Name"].ToString();
        txtUserName.Enabled = false;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
        var user = db.User.Single(m => m.UserName == Session["Name"].ToString());
        user.Password = txtPassword.Text;
        user.Name = txtName.Text;
        user.Sex = int.Parse(drop.SelectedValue);
        user.Address = txtAddress.Text;
        user.PhoneNum = txtPhone.Text;
        user.Email = txtEmail.Text;
        var reslut = db.User.SingleOrDefault(m => m.UserName == Session["Name"].ToString());
        if (txtName.Text == "" || txtPassword.Text == "" || txtAddress.Text == "" || txtPhone.Text == "" || txtEmail.Text == "") 
        {
            Response.Write("<script language=javascript>alert('请把信息输入完整！');</script>");
            return;
        }
        else
        {
            Response.Write("<script language=javascript>alert('修改成功！');</script>");
            db.SubmitChanges();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Session["Name"] = null;
        Response.Redirect("UserManage.aspx");
    }
}