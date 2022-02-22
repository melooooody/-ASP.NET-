using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_CartShop : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "欢迎光临本商城";
        lblName.Text = Session["UserName"].ToString();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gv1.PageIndex = e.NewPageIndex;
        var item = db.OrderItem.Where(m => m.OrderId == int.Parse(Session["UserId"].ToString()) && m.status == 0);
        Gv1.DataSource = item;             //引用刚才建立的数据源
        Gv1.DataBind();
        checkShop();
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)Gv1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                db.ExecuteCommand("delete from [OrderItem] where [ItemName]='" + Gv1.Rows[i].Cells[2].Text + "'");
                Response.Write("<script language=javascript>alert('已删除选中商品！');</script>");
                flag++;
                db.SubmitChanges();
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择商品！');</script>");
        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)Gv1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                Session[flag+"Name"]= Gv1.Rows[i].Cells[2].Text;
                Session[flag + "Num"] = Gv1.Rows[i].Cells[4].Text;
                flag++;
                Session["Num"] = flag;
                
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择商品！');</script>");
            return;
        }
        Session["userName"]=Session["UserName"].ToString();
        Response.Redirect("SubmitOrder.aspx");
    }

    public void checkShop()
    {
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            var shop = db.Shopkeeper.Single(m => m.Id == int.Parse(Gv1.Rows[i].Cells[5].Text));
            Gv1.Rows[i].Cells[5].Text = shop.ShopName.ToString();
        }
    }


    protected void btnShow_Click(object sender, EventArgs e)
    {
        var user = db.User.Single(m => m.UserName == Session["UserName"].ToString());
        var item = db.OrderItem.Where(m => m.OrderId == user.Id && m.status == 0);
        if (item.Count() == 0)
        {
            Response.Write("<script language=javascript>alert('购物车为空！');</script>");
            return;
        }
        Gv1.DataSource = item;
        Gv1.DataBind();
        checkShop();
    }
}