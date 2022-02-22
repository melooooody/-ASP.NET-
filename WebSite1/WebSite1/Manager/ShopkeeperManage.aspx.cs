using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ShopkeeperManage : System.Web.UI.Page
{
    MyShoppingWebDataContext db=new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "管理员页面";
    }

    public void checkStatus()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[6].Text == "1")
            {
                GridView1.Rows[i].Cells[6].Text = "已审核";
            }
            else if (GridView1.Rows[i].Cells[6].Text == "0")
            {
                GridView1.Rows[i].Cells[6].Text = "未审核";
            }
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (txt.Text.Trim() == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('请输入用户名！')</script>");
            return;
        }
        else
        {
            Response.Write(txt.Text);
            var result = db.Shopkeeper.SingleOrDefault(m => m.ShopName == txt.Text);
            if (result != null)
            {
                var shop = db.Shopkeeper.Where(m => m.ShopName.Contains(txt.Text));
                GridView1.DataSource = shop;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('未找到该用户！');</script>");
                return;
            }
            checkStatus();
        }
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        switch (drop.Text)
        {
            case "全部":
                GridView1.DataSource = LinqDataSource1;
                GridView1.DataBind();
                checkStatus();
                break;
            case "已审核":
                var shop = db.Shopkeeper.Where(m => m.status == 1);
                GridView1.DataSource = shop;
                GridView1.DataBind();
                checkStatus();
                break;
            case "未审核":
                var shop1 = db.Shopkeeper.Where(m => m.status == 0);
                GridView1.DataSource = shop1;
                GridView1.DataBind();
                checkStatus();
                break;
        }
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked && GridView1.Rows[i].Cells[6].Text == "未审核")
            {
                var Tab = db.Shopkeeper.Single(m => m.ShopName == GridView1.Rows[i].Cells[1].Text);
                Tab.status = 1;
                flag++;
                db.SubmitChanges();
                checkStatus();
                Response.Write("<script language=javascript>alert('申请审核成功！');</script>");
            }
            else if (cb.Checked && GridView1.Rows[i].Cells[6].Text == "已审核")
            {
                Response.Write("<script language=javascript>alert('请选择未审核的用户！');</script>");
                return;
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    protected void btnAlter_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                Session["Name"] = GridView1.Rows[i].Cells[1].Text;
                flag++;
                Response.Redirect("ShopAlter.aspx");
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                db.ExecuteCommand("delete from [Shopkeeper] where [ShopName]='" + GridView1.Rows[i].Cells[1].Text + "'");
                Response.Write("<script language=javascript>alert('已删除选中用户！');</script>");
                flag++;
                db.SubmitChanges();
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = LinqDataSource1;               //引用刚才建立的数据源
        GridView1.DataBind();
        checkStatus();
    }

}