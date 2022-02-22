using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopkeeper_ShopkeeperHome : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商家页面";
        lblName.Text = Session["ShopName"].ToString();
        var shop = db.Shopkeeper.Single(m => m.ShopName == lblName.Text);
        Session["ShopId"] = shop.Id;
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        switch (drop.Text)
        {
            case "全部":
                var goods = db.Goods.Where(m => m.ShopId == Session["ShopId"].ToString());
                Gv1 .DataSource = goods;
                Gv1.DataBind();
                break;
            case "已售空":
                var goods1 = db.Goods.Where(m => m.Num == 0 && m.ShopId == Session["ShopId"].ToString());
                Gv1.DataSource = goods1;
                Gv1.DataBind();
                break;
            case "未售空":
                var goods2 = db.Goods.Where(m => m.Num != 0 && m.ShopId == Session["ShopId"].ToString());
                Gv1.DataSource = goods2;
                Gv1.DataBind();
                break;
        }
    }

    protected void btnAddGoods_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewGoods.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gv1.PageIndex = e.NewPageIndex;
        var goods = db.Goods.Where(m => m.ShopId == Session["ShopId"].ToString());
        Gv1.DataSource = goods;             //引用刚才建立的数据源
        Gv1.DataBind();
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (txtb.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('请输入商品名！')</script>");
            return;
        }
        else
        {
            var result = db.Goods.SingleOrDefault(m => m.Title == txtb.Text);
            if (result != null)
            {
                var g = db.Goods.Where(m => m.Title.Contains(txtb.Text));
                Gv1.DataSource = g;
                Gv1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('未找到该用户！');</script>");
                return;
            }
        }
    }

    protected void btnAlter_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)Gv1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                Session["GoodsName"] = Gv1.Rows[i].Cells[2].Text;
                flag++;
                Response.Redirect("AlterGoods.aspx");
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
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
                TextBox tb = new TextBox();
                tb = (TextBox)Gv1.Rows[i].FindControl("txtAdd");
                int n = int.Parse(tb.Text);
                if (n < 1)
                {
                    Response.Write("<script language=javascript>alert('输入数量不小于1！');</script>");
                    return;
                }
                var Tab = db.Goods.Single(m => m.Title == Gv1.Rows[i].Cells[2].Text && m.ShopId == Session["ShopId"].ToString());
                Tab.status = 1;
                Tab.Num += n;
                flag++;
                db.SubmitChanges();
                Response.Write("<script language=javascript>alert('补货成功！');</script>");
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择商品！');</script>");
            return;
        }
    }

    protected void btnAlterNum_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < Gv1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)Gv1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                TextBox tb = new TextBox();
                tb = (TextBox)Gv1.Rows[i].FindControl("txtAdd");
                int n = int.Parse(tb.Text);
                if (n < 1)
                {
                    Response.Write("<script language=javascript>alert('输入数量不小于0！');</script>");
                    return;
                }
                var Tab = db.Goods.Single(m => m.Title == Gv1.Rows[i].Cells[2].Text && m.ShopId == Session["ShopId"].ToString());
                if (Tab.Num == 0)
                {
                    Tab.status = 0;
                    Tab.Num = 0;
                }
                else if (Tab.Num > 0)
                {
                    Tab.status = 1;
                    Tab.Num = n;
                }

                flag++;
                db.SubmitChanges();
                Response.Write("<script language=javascript>alert('修改数量成功！');</script>");
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择商品！');</script>");
            return;
        }
    }
}