using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FindPassword : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    Shopkeeper shop;
    User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "找回密码";
        Panel.Visible = false;
        txtName.Focus();
    }

    protected void txtOK_Click(object sender, EventArgs e)
    {
        if (txtName.Text == null)
        {
            Response.Write("<script language=javascript>alert('请输入用户名！');</script>");
            return;
        }

        if (rbShopKeeper.Checked == true)
        {
            var result = db.Shopkeeper.SingleOrDefault(m => m.ShopName == txtName.Text && m.status == 1);
            if (result != null)
            {
                shop = db.Shopkeeper.Single(m => m.ShopName == txtName.Text);
                lblQ1.Text = shop.Q1.ToString();
                lblQ2.Text = shop.Q2.ToString();
                Panel.Visible = true;
            }
            else
            {
                Response.Write("<script language=javascript>alert('没找到该用户！');</script>");
                return;
            }
        }
        else if (rbUser.Checked == true)
        {
            var result = db.User.SingleOrDefault(m => m.UserName == txtName.Text && m.status == 1);
            if (result != null)
            {
                user = db.User.Single(m => m.UserName == txtName.Text);
                lblQ1.Text = user.Q1.ToString();
                lblQ2.Text = user.Q2.ToString();
                Panel.Visible = true;
            }
            else
            {
                Response.Write("<script language=javascript>alert('没找到该用户！');</script>");
                return;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtA1.Text == "" || txtA2.Text == ""||txtNewPassword.Text == "" || txtCheck.Text == "")
        {
            Response.Write("<script language=javascript>alert('请输入相关信息！');</script>");
            Panel.Visible = true;
            return;
        }
        else if (txtNewPassword.Text != txtCheck.Text)
        {
            Response.Write("<script language=javascript>alert('两次输入密码不一，请重新输入！');</script>");
            Panel.Visible = true;
            return;
        }

        if (rbShopKeeper.Checked == true)
        {
            shop = db.Shopkeeper.Single(m => m.ShopName == txtName.Text);
            if (txtA1.Text == shop.A1 && txtA2.Text == shop.A2)
            {
                shop.Password = txtNewPassword.Text;
                db.SubmitChanges();
                Response.Redirect("Login.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('密保输入有误！')</script>");
                Panel.Visible = true;
                return;
            } 
        }
        else if (rbUser.Checked == true)
        {
            user = db.User.Single(m => m.UserName == txtName.Text);
            if (txtA1.Text == user.A1 && txtA2.Text == user.A2)
            {
                user.Password = txtNewPassword.Text;
                db.SubmitChanges();
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('密保输入有误！');</script>");
                Panel.Visible = true;
                return;
            }
            
        }

    }
}