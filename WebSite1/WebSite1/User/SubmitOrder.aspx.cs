using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_SubmitOrder : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "提交订单";
        var user = db.User.Single(m => m.UserName == Session["userName"].ToString());
        lblUserName.Text = Session["userName"].ToString();
        lblName.Text = user.Name.ToString();
        lblAddress.Text = user.Address.ToString();
        lblPhone.Text = user.PhoneNum.ToString();
        lblEmail.Text = user.Email.ToString();
        float total = 0;
        lblGoods.Text = "";
        for (int i = 0; i < int.Parse(Session["Num"].ToString()); i++)
        {
            var result= db.OrderItem.SingleOrDefault(m => m.OrderId == user.Id && m.ItemName == Session[i + "Name"].ToString() && m.status == 0);
            if (result != null)
            {
                var item = db.OrderItem.Single(m => m.OrderId == user.Id && m.ItemName == Session[i + "Name"].ToString() && m.status == 0);
                total += float.Parse((item.ItemPrice * float.Parse(item.ItemNum.ToString())).ToString());
                lblGoods.Text += item.ItemName + " " + "&nbsp;" + "×" + item.ItemNum + "<br />";
            }
        }
        lblTotalPrice.Text = total.ToString();
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        Order order = new Order();
        order.OrderNum = "XS" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("dd") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss");
        order.OrderDate = DateTime.Now;
        order.TotalPrice = float.Parse(lblTotalPrice.Text);
        order.Address = lblAddress.Text;
        order.OrderName = lblUserName.Text;
        order.OrderPhone = lblPhone.Text;
        //db.Order.InsertOnSubmit(order);
        //db.SubmitChanges();
        var user = db.User.Single(m => m.UserName == Session["userName"].ToString());
        for (int i = 0; i < int.Parse(Session["Num"].ToString()); i++)
        {
            var item = db.OrderItem.Single(m => m.OrderId == user.Id && m.ItemName == Session[i + "Name"].ToString() && m.status == 0);
            item.status = 1;
            db.SubmitChanges();
        }
        Response.Write("<script language=javascript>alert('订单支付成功！');</script>");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CartShop.aspx");
    }
}