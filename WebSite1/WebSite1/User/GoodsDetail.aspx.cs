using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_GoodsDetail : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request["id"];
        this.Title = "商品详情";
        if (Session["UserName"].ToString() == "")
        {
            Response.Write("<script language=javascript>alert('请登录！');</script>");
            Response.Redirect("~/Login.aspx");
        }
        lblName.Text = Session["UserName"].ToString();
        var goods = db.Goods.Single(m => m.Id == int.Parse(id));
        var shop = db.Shopkeeper.Single(m => m.Id == int.Parse(goods.ShopId.ToString()));
        lblGoodsName.Text = goods.Title.ToString();
        lblPrice.Text = goods.Price.ToString();
        lblKeeperName.Text = shop.ShopName.ToString();
        Image1.ImageUrl = goods.Img;
        lblDetail.Text = goods.Detail.ToString();
        txtNum.Focus();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtNum.Text.Trim() == "")
        {
            Response.Write("<script language=javascript>alert('请填写购买数量！');</script>");
            return;
        }
        else if (int.Parse(txtNum.Text) < 1)
        {
            Response.Write("<script language=javascript>alert('购买数量不得小于1！');</script>");
            return;
        }
        string id = Request["id"];
        OrderItem item = new OrderItem();
        var goods = db.Goods.Single(m => m.Id == int.Parse(id));
        var shop = db.Shopkeeper.Single(m => m.Id == int.Parse(goods.ShopId.ToString()));
        var user = db.User.Single(m => m.UserName == lblName.Text);
        item.OrderId = user.Id;
        item.ShopId = shop.Id;
        item.ItemName = goods.Title.ToString();
        item.ItemPrice = goods.Price;
        item.ItemNum = int.Parse(txtNum.Text);
        item.ItemImg = goods.Img;
        item.OrderId = user.Id;
        item.status = 0;
        if (item.ItemNum > goods.Num)
        {
            Response.Write("<script language=javascript>alert('该商品库存不足选购数量，请重新输入购买数量！');</script>");
            return;
        }

        var reslut = db.OrderItem.SingleOrDefault(m => m.ItemName == item.ItemName && m.ShopId == item.ShopId && m.OrderId == item.OrderId && m.status == 0);
        if (reslut != null)
        {
            var r = db.OrderItem.Single(m => m.ItemName == item.ItemName && m.ShopId == item.ShopId && m.OrderId == item.OrderId && m.status == 0);
            r.ItemNum += item.ItemNum;
            db.SubmitChanges();
            Response.Write("<script language=javascript>alert('已加入购物车！');</script>");
        }
        else
        {
            db.OrderItem.InsertOnSubmit(item);
            db.SubmitChanges();
            Response.Write("<script language=javascript>alert('已加入购物车！');</script>");
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("SelectGoods.aspx");
    }
}