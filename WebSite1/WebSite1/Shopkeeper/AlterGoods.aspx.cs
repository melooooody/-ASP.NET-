using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Shopkeeper_AlterGoods : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "修改商品信息";
        txtPrice.Focus();
        txtTitle.Text = Session["GoodsName"].ToString();
        txtTitle.Enabled = false;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
        var g = db.Goods.Single(m => m.ShopId == Session["ShopId"].ToString() && m.Title == Session["GoodsName"].ToString());
        g.Price = float.Parse(txtPrice.Text);
        g.Num = int.Parse(txtNum.Text);
        if (g.Num == 0)
        {
            g.status = 0;
        }
        else if (g.Num < 0)
        {
            Response.Write("<script language=javascript>alert('输入数量不小于0！');</script>");
            return;
        }
        string imgname = DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("dd") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss") + Path.GetExtension(UpImg.FileName);
        string imgpath = "~/Image/Goods/" + imgname;
        UpImg.SaveAs(MapPath(imgpath));
        g.Img = imgpath.ToString();
        g.Detail = txtDetail.Text;
        if (txtPrice.Text == "" || txtNum.Text == "")
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

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Session["GoodsName"] = null;
        Response.Redirect("ShopkeeperHome.aspx");
    }
}