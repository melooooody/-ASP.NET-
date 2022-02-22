using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ShopAlter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtPassword.Focus();
        txtShopName.Text = Session["Name"].ToString();
        txtShopName.Enabled = false;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
        var shop = db.Shopkeeper.Single(m => m.ShopName == Session["Name"].ToString());
        shop.Password = txtPassword.Text;
        shop.KeeperName = txtName.Text;
        shop.PhoneNum = txtPhone.Text;
        shop.Email = txtEmail.Text;
        if (txtName.Text == "" || txtPassword.Text == "" || txtPhone.Text == "" || txtEmail.Text == "") 
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

    protected void btnBack_Click1(object sender, EventArgs e)
    {
        Session["Name"] = null;
        Response.Redirect("ShopkeeperManage.aspx");
    }
}