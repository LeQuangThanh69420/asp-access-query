<!--#include file="connection.asp"-->
<%
	'lấy dữ liệu sắp xếp theo corder giảm dần
	sql = "select * from 0204466_Supplier_97"
	rs.open sql, conn 
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Nhà cung cấp</h1>
		<center>
			<font color=red>
				<%=Session("supplier_error")%>
			</font>
		
		<br>
		<a href="supplier_add.asp">Thêm mới nhà cung cấp</a>
		</center>
		<table border=1 cellspacing=5 cellpadding=5 align=center>
			<tr>
				<th>Mã</th>
				<th>Tên</th>
				<th>Địa chỉ</th>
				<th>Sđt</th>
				<th>Tax</th>
				<th>Trạng thái</th>
				<th>Sửa</th>
				<th>Xóa</th>
			</tr>
			<%
				if (rs.eof) then
					response.write("<tr><td colspan=6>Bảng không có dữ liệu!</td></tr>")
				else 
					while not rs.eof 
					%>
						<tr>
							<td><%=rs("sid")%></td>
							<td><%=rs("sname")%></td>
							<td><%=rs("saddress")%></td>
							<td><%=rs("sphone")%></td>
							<td><%=rs("stax")%></td>
							<td>
								<% if (rs("sstatus")=0) then
										response.write("Ngừng hoạt động")
								   else 
										response.write("Hoạt động")
								   end if 
								%>
							</td>
							<td><a href="supplier_edit.asp?sid=<%=rs("sid")%>">
								<button>Sửa</button>
							</a>
							</td>
							<td><a href="supplier_delete.asp?sid=<%=rs("sid")%>">
								<button>Xóa</button>
							</a>
							</td>
					<%		
					rs.movenext
					wend 
				end if
				rs.close 
				conn.close 
			%>
		</table>
	</body>
</html>