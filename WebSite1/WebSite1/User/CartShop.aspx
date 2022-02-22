<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CartShop.aspx.cs" Inherits="User_CartShop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color:rgb(208,224,235);
            text-align:center;
            height:100%;
            width: 100%;
        }
        .auto-style2 {
            width: 20%;
            height: 28px;
        }
        .auto-style3 {
            width: 40%;
            height: 28px;
        }
        .auto-style4 {
            height: 28px;
        }
        #menuUrl{
            margin:5%;
            width:90%;
            height:95%;
            background-color:#99CCFF;
        }
        .auto-style5 {
            height:30%;
            width: 100%;
        }
        #menuUrl td{
            text-align:center;
        }
        #manage{
            text-align:center;
            position:relative;
            float:right;
            height:60%;
            width:80%;
            background-color:rgb(255,252,241);
        }
    </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">
            <div id="TopLogo" style="height:35%;width:100%;">  
                <asp:Image ID="img" runat="server" Height="100%" Width="100%" ImageUrl="~/Image/Login/welcome.jpg" />
            </div>
            <div id="navigate" style="height:5%;width:100%;">

                <table class="auto-style1">
                    <tr>
                        <td style="color:rgb(242,46,0)" class="auto-style2">
                           你好，<strong><asp:Label ID="lblName" runat="server"></asp:Label></strong> ! &nbsp;</td>
                        <td class="auto-style3">
                            <asp:HyperLink ID="LinkGoods" runat="server"  Font-Bold="true" NavigateUrl="~/User/SelectGoods.aspx">商品页</asp:HyperLink>
                        </td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="LinkHome" runat="server" Font-Bold="true" NavigateUrl="~/User/HomePage.aspx">个人首页</asp:HyperLink>
                        </td>
                    </tr>
                </table>

            </div>
            <div id="menu" style="float:left;height:60%;width:20%;background-color:#4D87D6;">
                <div id="menuUrl">

                    <table class="auto-style5">
                        <tr>
                            <td style="background-color:white; font-size:medium;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-weight:bold;">我的</td>
                        </tr>
                        <tr>
                            <td>

                                <asp:HyperLink ID="LinkUser" runat="server" NavigateUrl="~/User/HomePage.aspx">个人信息</asp:HyperLink>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="LinkShopkeeper" runat="server" NavigateUrl="~/User/CartShop.aspx">购物车</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/MyOrder.aspx">我的订单</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="Exit" runat="server" NavigateUrl="~/Login.aspx">退出</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="manage">
                <br />

                <asp:Button ID="btnShow" runat="server" Text="查看全部" OnClick="btnShow_Click" />&nbsp;

                <asp:Button ID="btnDel" runat="server" Text="删除" OnClick="btnDel_Click" />&nbsp;
                <asp:Button ID="btn" runat="server" Text="提交订单" OnClick="btn_Click" />

                <br />
                <asp:GridView ID="Gv1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chk" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="封面">
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="50px" runat="server" ImageUrl='<%# Bind("ItemImg") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemName" HeaderText="名称" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="价格" />
                        <asp:BoundField DataField="ItemNum" HeaderText="购买数量" />
                        <asp:BoundField DataField="ShopId" HeaderText="商家" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyShoppingWebDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="OrderItem">
                </asp:LinqDataSource>

            </div>

        </div>
    </form>
</body>
</html>

