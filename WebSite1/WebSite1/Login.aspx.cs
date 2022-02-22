using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商城登录界面";
        Session["UserName"] = null;
        txtName.Focus();
    }

    protected void btnCreat_Click(object sender, EventArgs e)
    {
        if (rbUser.Checked == true)
        {
            Response.Redirect("User/Creat.aspx");
        }
        else
        {
            Response.Redirect("Shopkeeper/Creat.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "" || txtPassword.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('请输入用户名和密码！')</script>");
            return;
        }
        if (rbUser.Checked == true)
        {
            var result1 = db.User.SingleOrDefault(m => m.UserName == txtName.Text && m.Password == txtPassword.Text && m.status == 1);
            if (result1 != null)
            {
                
                Response.Write("<script language=javascript>alert('用户登录成功！');</script>");
                Session["UserName"] = txtName.Text;
                Response.Redirect("~/User/UserHome.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名或密码错误！');</script>");
                return;
            }
        }
        else
        {
            var result2 = db.Shopkeeper.SingleOrDefault(m => m.ShopName == txtName.Text && m.Password == txtPassword.Text && m.status == 1);
            if (result2 != null)
            {
                Response.Write("<script language=javascript>alert('商家登录成功！');</script>");
                Session["ShopName"] = txtName.Text;
                Response.Redirect("~/Shopkeeper/ShopkeeperHome.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名或密码错误！');</script>");
                return;
            }
        }
           
    }
}