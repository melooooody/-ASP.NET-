<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerLogin.aspx.cs" Inherits="ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height:142px;
            width: 100%;
        }
        .auto-style10 {
            text-align: center;
            height: 47px;
        }
        .auto-style11 {
            text-align: center;
            height: 48px;
        }
    </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;background-color:aqua;position:absolute;">
            <div style="height:35%;width:25%;top:33%;left:38%;position:absolute;background-color:white;border-radius:5px;"><br />
                <span style="font-family:Impact, Haettenschweiler, ‘Arial Narrow Bold’, sans-serif;color:cornflowerblue;font-size:32px;">&nbsp;LOGIN</span>
                
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style10">用户名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">密&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                </table>          
            </div>
        </div>
    </form>
</body>
</html>