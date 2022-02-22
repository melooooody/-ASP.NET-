<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopkeeperHome.aspx.cs" Inherits="Shopkeeper_ShopkeeperHome" %>

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
        .auto-style3 {
            margin-top: 0px;
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
                    <strong><asp:Label ID="lblName" runat="server"></asp:Label>的商品库</strong> 
                </div>
                
                <asp:DropDownList ID="drop" runat="server">
                    <asp:ListItem>全部</asp:ListItem>
                    <asp:ListItem>已售空</asp:ListItem>
                    <asp:ListItem>未售空</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtb" runat="server"></asp:TextBox>
                <asp:Button ID="btnFind" runat="server" Text="查找" OnClick="btnFind_Click" />
                <asp:Button ID="btnShowAll" runat="server" Text="显示全部" OnClick="btnShowAll_Click" />
                <asp:Button ID="btnAlter" runat="server" Text="修改信息" OnClick="btnAlter_Click" />
                <asp:Button ID="btnAddGoods" runat="server" Text="添加商品" OnClick="btnAddGoods_Click" />
                <asp:Button ID="btnAddNum" runat="server" Text="补货" OnClick="btnAddNum_Click" />
                <asp:Button ID="btnAlterNum" runat="server" Text="修改" OnClick="btnAlterNum_Click" />
                <br /><br />

                <asp:GridView ID="Gv1" Width="100%" AllowPaging="True" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="auto-style3">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chk" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="封面">
                            <ItemTemplate>
                                <asp:Image ID="img" runat="server" Width="50px" ImageUrl='<%# Bind("Img") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="商品名" />
                        <asp:BoundField DataField="Price" HeaderText="价格" />
                        <asp:BoundField DataField="Num" HeaderText="库存" />
                        <asp:BoundField DataField="AddDate" HeaderText="添加日期" 
                             DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false"/>
                        <asp:TemplateField HeaderText="商品描述">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Detail") %>' Width="200px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox ID="txtAdd" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:LinqDataSource ID="LinqSource" runat="server" ContextTypeName="MyShoppingWebDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Goods">
                </asp:LinqDataSource>

            </div>
        </div>
    </form>
</body>
</html>
