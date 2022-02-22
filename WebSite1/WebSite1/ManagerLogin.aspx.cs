using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ManagerLogin : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商城管理员登录";
        txtName.Focus();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "" || txtPassword.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('请输入用户名和密码！')</script>");
            return;
        }
        var result = db.Manager.SingleOrDefault(m => m.ID == int.Parse(txtName.Text) && m.Password == txtPassword.Text);
        if (result != null)
        {
            Response.Write("<script language=javascript>alert('登录成功！');</script>");
            Response.Redirect("~/Manager/UserManage.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('用户名或密码错误！');</script>");
        }

    }
}