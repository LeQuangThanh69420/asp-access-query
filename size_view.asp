<!--#include file="connection.asp"-->
<%
	'lấy dữ liệu sắp xếp theo corder giảm dần
	sql = "select * from 0204466_Size_97"
	rs.open sql, conn 
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Kích thước</h1>
		<center>
			<font color=red>
				<%=Session("size_error")%>
			</font>
		
		<br>
		<a href="size_add.asp">Thêm mới một kích thước</a>
		</center>
		<table border=1 cellspacing=5 cellpadding=5 align=center>
			<tr>
				<th>Mã</th>
				<th>Tên</th>
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
							<td><%=rs("sizeid")%></td>
							<td><%=rs("sizename")%></td>
							<td>
								<% if (rs("sizestatus")=0) then
										response.write("Ngừng hoạt động")
								   else 
										response.write("Hoạt động")
								   end if 
								%>
							</td>
							<td><a href="size_edit.asp?sizeid=<%=rs("sizeid")%>">
								<button>Sửa</button>
							</a>
							</td>
							<td><a href="size_delete.asp?sizeid=<%=rs("sizeid")%>">
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