<!--#include file="connection.asp"-->
<%
	sid = Request.Querystring("sid")
	'lấy dữ liệu cũ ra để điền vào form
	sql = "select * from 0204466_Supplier_97 where sid=" & sid 
	rs.open sql, conn 
	if (rs.eof) then
		session("supplier_error")="Dữ liệu không tồn tại!"
		Response.Redirect("supplier_view.asp")
	else
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Sửa nhà cung cấp</h1>
		<center>
			<font color=red>
				<%=Session("supplier_edit_error")%>
			</font>
		</center>
		<form action="supplier_edit_action.asp" method=POST>
		<table border=0 cellspacing=5 cellpadding=5 align=center>
            <input type=hidden value="<%=rs("sid")%>" name="sid">
			<tr>
				<td>Tên supplier:</td>
				<td><input type=text name=txtSName value="<%=rs("sname")%>"></td>
			</tr>
            <tr>
				<td>Địa chỉ:</td>
				<td><input type=text name=txtSAddress value="<%=rs("saddress")%>"></td>
			</tr>
            <tr>
				<td>Sđt:</td>
				<td><input type=text name=txtSPhone value="<%=rs("sphone")%>"></td>
			</tr>
            <tr>
				<td>Tax:</td>
				<td><input type=text name=txtSTax value="<%=rs("stax")%>"></td>
			</tr>
			<tr>
				<td>Trạng thái:</td>
				<td>
					<input type=radio name=rdSStatus value=1 <% if (rs("sstatus")=1) then response.write(" checked")%>>Hoạt động
					<Input type=radio name=rdSStatus value=0 <% if (rs("sstatus")=0) then response.write(" checked")%>>Ngừng hoạt động
				</td>
			</tr>
			<tr>
				<td align=right><input type=submit value="Cập nhật"></td>
				<td><input type=reset value="Hủy bỏ"></td>
			</tr>
		</table>
		</form>
	</body>
	<%
		end if 
		rs.close
		conn.close 
	%>
</html>