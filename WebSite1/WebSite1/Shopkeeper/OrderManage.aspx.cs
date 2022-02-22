using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopkeeper_OrderManage : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商家页面";
        lblName.Text = Session["ShopName"].ToString();
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        switch (drop.Text)
        {
            case "未发货":
                var item = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status == 1);
                Gv1.DataSource = item;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
            case "运输中":
                var item1 = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status == 2);
                Gv1.DataSource = item1;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
            case "已签收":
                var item2 = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status == 3);
                Gv1.DataSource = item2;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
        }
    }

    public void checkShop()
    {
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            var user = db.User.Single(m => m.Id == int.Parse(Gv1.Rows[i].Cells[6].Text));
            Gv1.Rows[i].Cells[6].Text = user.UserName.ToString();
            switch (Gv1.Rows[i].Cells[7].Text)
            {
                case "1":
                    Gv1.Rows[i].Cells[7].Text = "未发货";
                    break;
                case "2":
                    Gv1.Rows[i].Cells[7].Text = "运输中";
                    break;
                case "3":
                    Gv1.Rows[i].Cells[7].Text = "已签收";
                    break;
            }
        }
    }

    public void showAll()
    {
        var item = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status != 0);
        Gv1.DataSource = item;
        Gv1.DataBind();
        checkShop();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gv1.PageIndex = e.NewPageIndex;
        switch (drop.Text)
        {
            case "未发货":
                var item = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status == 1);
                Gv1.DataSource = item;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
            case "运输中":
                var item1 = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status == 2);
                Gv1.DataSource = item1;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
            case "已签收":
                var item2 = db.OrderItem.Where(m => m.ShopId     == int.Parse(Session["ShopId"].ToString()) && m.status == 3);
                Gv1.DataSource = item2;             //引用刚才建立的数据源
                Gv1.DataBind();
                checkShop();
                break;
        }
    }


    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        var item = db.OrderItem.Where(m => m.ShopId == int.Parse(Session["ShopId"].ToString()) && m.status != 0);
        Gv1.DataSource = item;
        Gv1.DataBind();
        checkShop();
    }

    protected void btnAddNum_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)Gv1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                if (Gv1.Rows[i].Cells[7].Text == "运输中")
                {
                    Response.Write("<script language=javascript>alert('该商品已发出！');</script>");
                    return;
                }
                else if (Gv1.Rows[i].Cells[7].Text == "已签收")
                {
                    Response.Write("<script language=javascript>alert('该商品已被签收！');</script>");
                    return;
                }
                var r = db.OrderItem.Single(m => m.ItemId == int.Parse(Gv1.Rows[i].Cells[2].Text));
                r.status = 2;
                var g = db.Goods.Single(m => m.ShopId == Session["ShopId"].ToString() && m.Title == Gv1.Rows[i].Cells[3].Text);
                g.Num -= int.Parse(Gv1.Rows[i].Cells[5].Text);
                if (g.Num < 0)
                {
                    Response.Write("<script language=javascript>alert('库存不足，发货失败！');</script>");
                    return;
                }
                else if (g.Num == 0)
                {
                    g.status = 0;
                }
                Response.Write("<script language=javascript>alert('商品发货成功！');</script>");
                flag++;
                db.SubmitChanges();
                showAll();
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择商品！');</script>");
        }
    }
}