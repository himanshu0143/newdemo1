<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="utility.RequireData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>SAMERP PROJECT</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/SAMERP/config/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/SAMERP/config/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/SAMERP/config/css/uniform.css" />
<link rel="stylesheet" href="/SAMERP/config/css/select2.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-style.css" />
<link rel="stylesheet" href="/SAMERP/config/css/matrix-media.css" />
<link href="/SAMERP/config/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

</head>
<style>
#snackbar {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 15px;
	border-radius: 50px 50px;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">Matrix Admin</a>
		</h1>
	</div>


	<!--start-top-serch-->
	<div id="search">
		<%
			if (request.getAttribute("status") != null) {
		%>
		<div id="snackbar"><%=request.getAttribute("status")%></div>
		<%
			}
		%>

		<button type="submit" class="tip-bottom">LOGOUT</button>
	</div>
	<!--close-top-serch-->
	<!--sidebar-menu-->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li><a href="/SAMERP/index.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li class="submenu active open"><a href="#"><i
					class="icon icon-th-list"></i> <span>Settings</span> <span
					class="label label-important">7</span></a>
				<ul>
					<li><a
						href="/SAMERP/jsp/admin/settings/addMaterialSuppliers.jsp">Add
							Material Supplier</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addEmployee.jsp">Add
							Employee</a></li>
					<li><a href="/SAMERP/jsp/admin/settings/addOrganization.jsp">Add
							Organization</a></li>
					<li class="active"><a
						href="/SAMERP/jsp/admin/settings/addCustomer.jsp">Add Customer</a></li>
				</ul></li>

			<li><a href="charts.html"><i class="icon icon-signal"></i> <span>Charts
						&amp; graphs</span></a></li>
			<li><a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a>
			</li>
			<li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
			<li><a href="grid.html"><i class="icon icon-fullscreen"></i>
					<span>Full width</span></a></li>
			<li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons
						&amp; icons</span></a></li>
			<li><a href="interface.html"><i class="icon icon-pencil"></i>
					<span>Eelements</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-file"></i>
					<span>Addons</span> <span class="label label-important">5</span></a>
				<ul>
					<li><a href="index2.html">Dashboard2</a></li>
					<li><a href="gallery.html">Gallery</a></li>
					<li><a href="calendar.html">Calendar</a></li>
					<li><a href="invoice.html">Invoice</a></li>
					<li><a href="chat.html">Chat option</a></li>
				</ul></li>

		</ul>
	</div>
	<!--sidebar-menu-->

	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" class="tip-bottom"
					data-original-title="Go to Home"><i class="icon-home"></i> Home</a>
				<a href="#" class="current">Add Customer</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>Add Customer</h5>
						</div>
						<div class="widget-content nopadding">
							<form action="/SAMERP/AddCustomer.do" method="post"
								class="form-horizontal">
								<div class="control-group">
									<label class="control-label"> Customer Name :</label>
									<div class="controls">
										<input type="text" name="custname" id="custname" class="span6"
											placeholder="Customer Name"
											onkeyup="this.value=this.value.toUpperCase()" required />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Address :</label>
									<div class="controls">
										<input type="text" name="address" class="span6"
											placeholder="Address" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Contact No :</label>
									<div class="controls">
										<input type="text" name="contactno" class="span3"
											placeholder="Contact Number"
											onkeypress="return isNumber(event)" maxlength="10" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Rate :</label>
									<div class="controls">
										<input type="text" name="rate" class="span3"
											placeholder="Contact Number"
											onkeypress="return isNumber(event)" maxlength="10" />
									</div>
								</div>


								<div class="form-actions">
									<button type="submit" name="insertorganizer"
										class="btn btn-success"
										style="position: relative; right: 700px; float: right;">Submit</button>
									<a href="/SAMERP/index.jsp"><button type="button"
											class="btn btn-danger "
											style="position: relative; right: 550px; float: right;">Exit</button></a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Data table</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th></th>
										<th>Customer Name</th>
										<th>Address</th>
										<th>Contact No</th>
										<th>Rate</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									RequireData data = new RequireData();

									List details = data.getCustomerList();
									int srno = 0;
									String custid = "";
									String custname = "";
									String address = "";
									String contact_no = "";
									String rate = "";

									if (details != null) {
										System.out.println("in Print Invoice.jsp" + details);

										Iterator itr = details.iterator();
								%>
								<tbody>
									<%
										while (itr.hasNext()) {
												srno++;
												custid = itr.next().toString();
												custname = itr.next().toString();
												address = itr.next().toString();
												contact_no = itr.next().toString();
												rate = itr.next().toString();
									%>
									<tr class="gradeX">
										<td><%=srno%></td>
										<td><%=custname%></td>
										<td><%=address%></td>
										<td><%=contact_no%></td>
										<td><%=rate%></td>
										<td><a href="#update" data-toggle='modal'
											onclick='getSr(<%=custid%>)'>Update</a> / <a
											href="/SAMERP/AddCustomer.do?deleteid=<%=custid%>">Delete</a></td>
									</tr>
									<%
										}
										}
									%>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>


		</div>

	</div>

	<!--end-main-container-part-->

	<!--Footer-part-->

	<div class="row-fluid">
		<div id="footer" class="span12">
			2013 &copy; Matrix Admin. Brought to you by <a
				href="http://themedesigner.in">Themedesigner.in</a>
		</div>
	</div>

	<!--end-Footer-part-->
	<!-- Model -->
	<div class="modal fade hide" id="update" role="dialog">
		<div class="modal-dialog">
		<form action="/SAMERP/AddCustomer.do" method="post"
						class="form-horizontal" name="customerupdateform">
						
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Update Customer Data</h4>
				</div>
				<div class="modal-body">


					<div class="control-group">
							<label class="control-label"> Customer Name :</label>
							<div class="controls">
								<input type="text" name="custname" id="update_custname"
									placeholder="Customer Name"
									onkeyup="this.value=this.value.toUpperCase()" required />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Address :</label>
							<div class="controls">
								<input type="text" name="address" id="update_address" placeholder="Address" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Contact No :</label>
							<div class="controls">
								<input type="text" name="contactno" id="update_contactno" placeholder="Contact Number"
									onkeypress="return isNumber(event)"  maxlength="10" />
									<input type="hidden" name="custid" id="custid"/>
							</div>
						</div>
						<div class="control-group">
									<label class="control-label">Rate :</label>
									<div class="controls">
										<input type="text" name="rate" id="update_rate" class="span3"
											placeholder="Rate"
											onkeypress="return isNumber(event)" maxlength="10" />
									</div>
						</div>


						
							
					
				</div>
			</div>
			<div class="modal-footer">
				<div class="form-actions">
							<button type="submit" name="insertorganizer"
								class="btn btn-success"
								style="float: right;">Submit</button>
							</div>

			</div>
			</form>
		</div>
	</div>
	<!-- Model End -->
	<script>

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && ( charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function getSr(id){
	    var xhttp;
		xhttp = new XMLHttpRequest();
		try{ 
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var demoStr = this.responseText.split("~");
				
 				document.getElementById("custid").value = demoStr[0];
 				document.getElementById("update_custname").value = demoStr[1];
 				document.getElementById("update_address").value = demoStr[2];
 				document.getElementById("update_contactno").value = demoStr[3];
 				document.getElementById("update_rate").value = demoStr[4];
 				
			}

		};
		
		xhttp.open("GET", "/SAMERP/AddCustomer.do?q=" + id, true);
		xhttp.send();
		}
		catch(e)
		{
			alert("Unable to connect to server");
		}  
}

function DeleteCustomer(id){
	var xhttp;
	xhttp = new XMLHttpRequest();
	try{ 
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var demoStr = this.responseText.split("~");
				
		}

	};
	
	xhttp.open("POST", "/SAMERP/AddCustomer.do?deleteid=" + id, true);
	xhttp.send();
	}
	catch(e)
	{
		alert("Unable to connect to server");
	}     
}

</script>
	<script src="/SAMERP/config/js/jquery.min.js"></script>
	<script src="/SAMERP/config/js/jquery.ui.custom.js"></script>
	<script src="/SAMERP/config/js/bootstrap.min.js"></script>
	<script src="/SAMERP/config/js/jquery.uniform.js"></script>
	<script src="/SAMERP/config/js/select2.min.js"></script>
	<script src="/SAMERP/config/js/jquery.dataTables.min.js"></script>
	<script src="/SAMERP/config/js/matrix.js"></script>
	<script src="/SAMERP/config/js/matrix.tables.js"></script>
</body>
</html>
