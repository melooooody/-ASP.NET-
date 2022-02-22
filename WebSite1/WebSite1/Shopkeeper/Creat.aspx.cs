using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopkepper_Creat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商家申请注册";
        txtName.Focus();
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
        Shopkeeper Shoper = new Shopkeeper();
        Shoper.Password = txtPassword.Text;
        Shoper.ShopName = txtShopName.Text;
        Shoper.KeeperName = txtName.Text;
        Shoper.PhoneNum = txtPhone.Text;
        Shoper.Email = txtEmail.Text;
        Shoper.RegisterDate = DateTime.Now;
        Shoper.Q1 = dropQ1.Text;
        Shoper.A1 = txtQ1.Text;
        Shoper.Q2 = dropQ2.Text;
        Shoper.A2 = txtQ2.Text;
        Shoper.status = 0;
        var reslut = db.Shopkeeper.SingleOrDefault(m => m.ShopName == txtShopName.Text);
        if (txtShopName.Text == "" || txtPassword.Text == "" || txtQ1.Text == "" || txtQ2.Text == "")
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
            db.Shopkeeper.InsertOnSubmit(Shoper);
        }
        db.SubmitChanges();
        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}