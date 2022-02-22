using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Creat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "用户申请注册";
        txtName.Focus();
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
        User user = new User();
        user.UserName = txtUserName.Text;
        user.Password = txtPassword.Text;
        user.Name = txtName.Text;
        user.Sex = int.Parse(drop.SelectedValue);
        user.Address = txtAddress.Text;
        user.PhoneNum = txtPhone.Text;
        user.Email = txtEmail.Text;
        user.RegisterDate = DateTime.Now;
        user.Q1 = dropQ1.Text;
        user.A1 = txtQ1.Text;
        user.Q2 = dropQ2.Text;
        user.A2 = txtQ2.Text;
        user.status = 0;
        var reslut = db.User.SingleOrDefault(m => m.UserName == txtUserName.Text);
        if (txtName.Text == "" || txtPassword.Text == "" || txtQ1.Text == "" || txtQ2.Text == "" || txtUserName.Text == "" || txtAddress.Text == "" || txtPhone.Text == "" || txtEmail.Text == "")
        {
            Response.Write("<script language=javascript>alert('请把信息输入完整！');</script>");
            return;
        }
        else if (reslut != null)
        {
            Response.Write("<script language=javascript>alert('该用户名已存在！');</script>");
            return;
        }
        else
        {
            Response.Write("<script language=javascript>alert('申请注册成功，请等待审核！');</script>");
            db.User.InsertOnSubmit(user);
        }
        db.SubmitChanges();
        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}