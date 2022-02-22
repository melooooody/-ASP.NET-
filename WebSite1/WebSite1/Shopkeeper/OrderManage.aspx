<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderManage.aspx.cs" Inherits="Shopkeeper_OrderManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #menu{
            float:left;
            height:65%;
            width:20%;
            background-color:#4D87D6;
        }
        #menuUrl{
            margin:5%;
            width:90%;
            height:95%;
            background-color:#99CCFF;
        }
        .auto-style1 {
            height:30%;
            width: 100%;
        }
        #menuUrl td{
            text-align:center;
        }
        #manage{
            background-color:rgb(255,252,241);
            text-align:center;
            float:right;
            height:65%;
            width:80%;
        }
        .auto-style2 {
            height: 10%;
            width: 100%;
        }
        </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">
            <div id="TopLogo" style="height:35%;width:100%;background-color:yellow;">
                 <asp:Image ID="img" runat="server" Height="100%" Width="100%" ImageUrl="~/Image/Login/welcome.jpg" />
            </div>
            <div id="menu">
                <div id="menuUrl">

                    <table class="auto-style1">
                        <tr>
                            <td style="background-color:white; font-size:medium;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-weight:bold;">商品管理</td>
                        </tr>
                        <tr>
                            <td>

                                <asp:HyperLink ID="LinkUser" runat="server" NavigateUrl="ShopkeeperHome.aspx">商品库</asp:HyperLink>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="LinkShopkeeper" runat="server" NavigateUrl="OrderManage.aspx">订单处理</asp:HyperLink>
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
                <div style="text-align:center;font-size:x-large;" class="auto-style2">
                    <strong><asp:Label ID="lblName" runat="server"></asp:Label>订单信息</strong> 
                </div>
                
                <asp:DropDownList ID="drop" runat="server">
                    <asp:ListItem>未发货</asp:ListItem>
                    <asp:ListItem>运输中</asp:ListItem>
                    <asp:ListItem>已签收</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnFind" runat="server" Text="查看" OnClick="btnFind_Click" />&nbsp;
                <asp:Button ID="btnShow" runat="server" Text="显示全部" OnClick="btnShowAll_Click" />&nbsp;
                <asp:Button ID="btnSend" runat="server" Text="发货" OnClick="btnAddNum_Click" />
                <asp:GridView ID="Gv1" Width="100%" AllowPaging="True" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                        <asp:BoundField DataField="ItemId" HeaderText="商品编号" />
                        <asp:BoundField DataField="ItemName" HeaderText="商品名称" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="商品价格" />
                        <asp:BoundField DataField="ItemNum" HeaderText="商品数量" />
                        <asp:BoundField DataField="OrderId" HeaderText="购买用户名" />
                        <asp:BoundField DataField="status" HeaderText="运输状态" />
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
                <br /><br />

            </div>
        </div>
    </form>
</body>
</html>
